//
//  RankingBooks.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingBooks: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeViewModel: HomeViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.registerDate, ascending: false)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)],
        animation: .default)
    private var clips: FetchedResults<Clip>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Phrase.createdDate, ascending: true)],
        animation: .default)
    private var phrases: FetchedResults<Phrase>

    @State var rankedBooks: [Book] = []

    var isCompleted: Bool {
        !rankedBooks.isEmpty
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    @State private var showLoading: Bool = false
    
    var selectedDate: DateRange
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: .constant(isCompleted),
                                    navigationType: .chevron,
                                    title: "책 순위 선정하기",
                                    rightTitle: "다음",
                                    onChevron: { dismiss() },
                                    onRightButton: { onNextButton() })
                
                VStack {
                    HeaderSection(title: "인상깊은 책들을 선택해주세요",
                                  subtitle: "오래 기억하고 싶은 책이 있나요? 순위를 매겨보세요.")
                    
                    HStack(spacing: 14) {
                        ForEach(1..<4) { i in
                            if rankedBooks.count >= i {
                                fetchHomeImage(url: rankedBooks[i-1].thumbnail ?? "")
                            } else {
                                EmptyBox(width: 105, height: 155, text: "\(i)위", isButton: false)
                            }
                        }
                    }
                    .padding(.top, 30)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("내가 읽은 책빵 목록")
                                .font(.bookCaption)
                                .foregroundStyle(.typo50)
                                .padding(.vertical, 15)
                                .padding(.leading, 30)
                            
                            // 책 목록
                            LazyVGrid(columns: columns, spacing: 14) {
                                ForEach(booksList, id: \.self) { book in
                                    Button {
                                        if rankedBooks.contains(book) {
                                            rankedBooks.removeAll(where: { $0 == book })
                                        } else if rankedBooks.count < 3 {
                                            rankedBooks.append(book)
                                        }
                                    } label: {
                                        ZStack {
                                            fetchHomeImage(url: book.thumbnail ?? "")
                                            if rankedBooks.contains(book) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.black.opacity(0.3))
                                                RoundedRectangle(cornerRadius: 10)
                                                    //.inset(by: 1)
                                                    .stroke(.greenMain100, lineWidth: 2)
                                            }
                                        }
                                        .fixedSize()
                                    }
                                }
                            }
                            
                        }
                    }
                }
                .padding(.top, 30)
            }
            .background(.backLighter)
            .navigationBarBackButtonHidden()
            
            if showLoading {
                ReceiptLoading()
            }
        }
    }
    
    private func onNextButton() {
        makeReceipt()
        
        self.showLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            dismiss()
        }
    }
    
    // Jerrie Comment: 데이터 저장하는 코드가 뷰랑 관련이 없는데 뷰 안에 함수로 넣은게 적절하지 않은 것 같다는 생각입니다. 근데 또 어디다 둬야할지는 잘 모르겠다는
    private func makeReceipt() {
        withAnimation {
            let newReceipt = Receipt(context: viewContext)
            
            newReceipt.year = Int16(selectedDate.year)
            newReceipt.isFirstHalf = selectedDate.isFirstHalf
            
            newReceipt.bookCount = Int16(booksInPeriod.count) // 읽은 책 수
            newReceipt.mostGenre = mostCommonGenre // 가장 많이 읽은 장르
            
            // 인상깊은 책
            rankedBooks.enumerated().forEach { (index, book) in
                let newRankedBook = RankedBook(context: viewContext)
                
                newRankedBook.receipt = newReceipt
                newRankedBook.rank = Int16(index+1)
//                newRankedBook.book = book
                newRankedBook.bookTitle = book.name
                newRankedBook.bookThumbnail = book.thumbnail
            }
            
            // 구절 많이 등록한 책
            mostAddedBooks.enumerated().forEach { (index, element) in
                let newTopQuotedBook = TopQuotedBook(context: viewContext)
                
                newTopQuotedBook.receipt = newReceipt
                newTopQuotedBook.rank = Int16(index+1)
//                newTopQuotedBook.book = element.0
                newTopQuotedBook.bookTitle = element.0.name
                newTopQuotedBook.bookThumbnail = element.0.thumbnail
                newTopQuotedBook.phraseCount = Int16(element.1)
            }
            
            // 구절 많이 등록한 클립
            mostAddedClips.enumerated().forEach { (index, element) in
                let newTopQuotedClip = TopQuotedClip(context: viewContext)
                
                newTopQuotedClip.receipt = newReceipt
                newTopQuotedClip.rank = Int16(index+1)
//                newTopQuotedClip.clip = element.0
                newTopQuotedClip.clipColor = element.0.color
                newTopQuotedClip.clipShape = element.0.design
                newTopQuotedClip.clipTitle = element.0.title
                newTopQuotedClip.phraseCount = Int16(element.1)
            }
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private extension RankingBooks {
    // 기간 내에 작성한 phrase list
    var filteredPhrases: [Phrase] {
        let startDate = Date(y: selectedDate.year, m: selectedDate.isFirstHalf ? 1 : 7, d: 1) ?? Date()
        let endDate = Date(y: selectedDate.year, m: selectedDate.isFirstHalf ? 6 : 12, d: 31) ?? Date()
        
        return phrases.filter { guard let phraseDate = $0.createdDate else { return false }
            if phraseDate >= startDate && phraseDate <= endDate {
                return true
            }
            return false
        }
    }
    
    // key: 기간 내에 phrase를 저장한 book, value: 저장된 phrase 개수
    var booksInPeriod: [Book:Int] {
        var bookDict = Dictionary<Book, Int>()
        
        for phrase in filteredPhrases {
            if let book = phrase.book {
                if let count = bookDict[book] {
                    bookDict.updateValue(count+1, forKey: book)
                } else {
                    bookDict[book] = 1
                }
            }
        }
        return bookDict
    }
    
    // 가장 phrase를 많이 저장한 book 3순위
    var mostAddedBooks: [(Book, Int)] {
        Array(booksInPeriod.sorted { $0.value > $1.value }.prefix(3))
    }
    
    // key: 기간 내에 phrase를 저장한 clip, value: 저장된 phrase 개수
    var clipsInPeriod: [Clip:Int] {
        var clipDict = Dictionary<Clip, Int>()
        
        for phrase in filteredPhrases {
            if let clipSet = phrase.clips as? Set<Clip> {
                for clip in clipSet {
                    if let count = clipDict[clip] {
                        clipDict.updateValue(count+1, forKey: clip)
                    } else {
                        clipDict[clip] = 1
                    }
                }
            }
        }
        return clipDict
    }
    
    // 가장 phrase를 많이 저장한 clip 3순위
    var mostAddedClips: [(Clip, Int)] {
        Array(clipsInPeriod.sorted { $0.value > $1.value }.prefix(3))
    }
    
    // 기간 내 구절을 등록한 책들 중 가장 많이 해당되는 장르
    var mostCommonGenre: String? {
        let genreCounts = booksList.reduce(into: [String: Int]()) { counts, book in
            if let genre = book.genre {
                counts[genre, default: 0] += 1
            }
        }
        return genreCounts.max(by: { $0.value < $1.value })?.key
    }
    
    // 책 순위 매길 목록들
    var booksList: [Book] {
        Array(booksInPeriod.keys).sorted { $0.registerDate ?? Date() < $1.registerDate ?? Date() }
    }
}

