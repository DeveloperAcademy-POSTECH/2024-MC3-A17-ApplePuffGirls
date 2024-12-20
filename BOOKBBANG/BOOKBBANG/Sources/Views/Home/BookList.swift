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
    @State var sort: SortBookBy = .recentRegister
    @State var showDeleteAlert: Bool = false
    
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
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            SortingBookPicker(sort: $sort)
            
            if sortedBooks.count == 0 {
                HStack {
                    EmptyBox(width: 105, height: 155)
                        .onTapGesture {
                            homeViewModel.transition(to: .searchBook)
                        }
                    
                    VStack(spacing: 0) {
                        Image(.induceAddingBook)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190)
                            .padding(.bottom, 4)
                    }
                    .padding(.leading, 40)
                }
                .padding(.horizontal, 20)
            }
            else {
                LazyVGrid(columns: columns, spacing: 12) {
                    
                    EmptyBox(width: 105, height: 155)
                        .onTapGesture {
                            homeViewModel.transition(to: .searchBook)
                        }
                    
                    ForEach(sortedBooks, id: \.self) { book in
                        
                        fetchHomeImage(url: book.thumbnail ?? "")
                            .onTapGesture {
                                homeViewModel.selectedBook = book
                                homeViewModel.transition(to: .detailBook)
                            }
                            .contextMenu {
                                Button(role: .destructive) {
                                    
                                    showDeleteAlert = true
                                }
                                label: {
                                    Label("삭제하기", systemImage: "trash")
                                }
                            }
                            .alert(Text("삭제하면 해당 책은 되돌릴 수 없습니다."), isPresented: $showDeleteAlert, actions: {
                                alertView(book: book)
                            }, message: { Text("책을 삭제하시겠습니까?")})
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func alertView(book: Book) -> some View {
        Button("취소", role: .cancel) { }
        Button("삭제하기", role: .destructive) { deleteBook(book: book) }
    }
    
    private func deleteBook(book: Book) {
        homeViewModel.transition(to: .home)
        homeViewModel.selectedBook = nil
        
        viewContext.delete(book)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
