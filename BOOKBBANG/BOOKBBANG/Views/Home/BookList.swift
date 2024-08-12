//
//  BookList.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 메인화면에 보이는 책별 리스트 화면입니다.

import SwiftUI

enum Display {
    case main
    case recipt
}

struct BookList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.registerDate, ascending: false)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State var display: Display = .main
    @State var sort: SortBookBy = .recentRegister
    
    var sortedBooks: [Book] {
        switch sort {
        case .recentRegister:
            return books.sorted { $0.registerDate ?? Date() > $1.registerDate ?? Date() }
        case .recentRead:
            return books.sorted { $0.readDate ?? Date() > $1.readDate ?? Date() }
        case .registerPhrase:
            return books.sorted { getPhraseRecentDate(phrases: $0.phrases) > getPhraseRecentDate(phrases: $1.phrases) }
        }
    }
    
    func getPhraseRecentDate(phrases: NSSet?) -> Date {
        guard let phraseArray = phrases?.allObjects as? [Phrase] else {
            return Date()
        }
        
        if let recentDate = phraseArray.compactMap({ $0.createdDate }).max() {
            return recentDate
        }
        return Date()
    }
    
    // @State var rankedBooks: [String] = []
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // 정렬 버튼
            if display == .main {
                SortingBookPicker(sort: $sort)
            }
            
            LazyVGrid(columns: columns, spacing: 12) {
                if display == .main {
                    EmptyBox(width: 105, height: 155)
                        .onTapGesture {
                            homeViewModel.transition(to: .searchBook)
                        }
                }
                
                ForEach(sortedBooks, id: \.self) { book in
                    
                    fetchHomeImage(url: book.thumbnail ?? "")
                        .onTapGesture {
                            homeViewModel.selectedBook = book
                            homeViewModel.transition(to: .detailBook)
                        }
                    
                    
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 20)
    }
}


#Preview {
    BookList(homeViewModel: HomeViewModel(), display: .recipt)
        .padding(.horizontal,2)
}
