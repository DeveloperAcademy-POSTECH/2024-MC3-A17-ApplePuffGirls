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
        return Array(booksInPeriod.sorted { $0.value > $1.value }.prefix(3))
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
        return Array(clipsInPeriod.sorted { $0.value > $1.value }.prefix(3))
    }
    
    // 기간 내 구절을 등록한 책들 중 가장 많이 해당되는 장르
    var mostCommonGenre: String? {
        let genreCounts = booksInPeriod.keys.reduce(into: [String: Int]()) { counts, book in
            if let genre = book.genre {
                counts[genre, default: 0] += 1
            }
        }
        return genreCounts.max(by: { $0.value < $1.value })?.key
    }

    @State var rankedBooks: [Book] = []

    var isCompleted: Bool {
        return !rankedBooks.isEmpty
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    @State private var showGif: Bool = false
    
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
                                EmptyBox(width: 106, height: 155, text: "\(i)위", isButton: false)
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
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(books, id: \.self) { book in
                                    Button {
                                        if rankedBooks.contains(book) {
                                            rankedBooks.removeAll(where: { $0 == book })
                                        } else if rankedBooks.count < 3 {
                                            rankedBooks.append(book)
                                        }
                                    } label: {
                                        fetchHomeImage(url: book.thumbnail ?? "")
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
            
            if showGif {
                VStack {
                    Spacer()
                    
                    GifImageView("receiptVideo")
                        .frame(width: 200, height: 200)
                    
                    Text("빵수증 출력 중 . . .")
                        .font(.bookTitle)
                        .foregroundStyle(.typo50)
                        .kerning(-0.3)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.backLighter)
                .ignoresSafeArea()
            }
        }
    }
    
    private func onNextButton() {
        
        makeReceipt()
        
        self.showGif = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            showGif = false
            dismiss()
        }
    }
    
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
                newRankedBook.book = book
            }
            
            // 구절 많이 등록한 책
            mostAddedBooks.enumerated().forEach { (index, element) in
                let newTopQuotedBook = TopQuotedBook(context: viewContext)
                
                newTopQuotedBook.receipt = newReceipt
                newTopQuotedBook.rank = Int16(index+1)
                newTopQuotedBook.book = element.0
                newTopQuotedBook.phraseCount = Int16(element.1)
            }
            
            // 구절 많이 등록한 클립
            mostAddedClips.enumerated().forEach { (index, element) in
                let newTopQuotedClip = TopQuotedClip(context: viewContext)
                
                newTopQuotedClip.receipt = newReceipt
                newTopQuotedClip.rank = Int16(index+1)
                newTopQuotedClip.clip = element.0
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

