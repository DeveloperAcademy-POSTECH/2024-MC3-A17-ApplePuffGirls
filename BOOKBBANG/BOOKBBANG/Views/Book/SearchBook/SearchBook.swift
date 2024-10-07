//
//  SearchBook.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI
import UIKit

struct SearchBook: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var router = SearchRouter()
    
    @State private var searchText: String = ""
    @State private var selectedBookID: String? = nil
    @State private var bookSelected: Bool = false
    @State private var selectedBook: Documents?
    
    @ObservedObject var book: BookData = BookData()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: $bookSelected,
                                    navigationType: .chevron,
                                    title: "새로운 책 추가하기",
                                    rightTitle: "다음",
                                    onChevron: { homeViewModel.transition(to: .home) },
                                    onRightButton: { homeViewModel.transition(to: .addBook) })
                
                SearchBookProgressBar(process: 1)
                    .padding(.bottom, 28)
                
                SearchBookSearchBar(searchText: $searchText, searchRouter: router)
                    .padding(.bottom, 20)
                    
                ScrollView {
                    Spacer().frame(height: 20)
                    
                    LazyVStack {
                        if let bookList = router.bookList {
                            ForEach(bookList, id: \.self) { book in
                                SearchBookListRow(selectedBookID: $selectedBookID,
                                                  book: book)
                                .padding(.bottom, 10)
                                .padding(.leading, 20)
                                
                                VStack{}
                                    .frame(maxWidth: UIScreen.main.bounds.width)
                                    .frame(height: 0.5)
                                    .background(.divider)
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 14)
                            }
                        }
                    }
                    HStack {
                        Text("원하는 책이 없나요?")
                            .foregroundStyle(.typo50)
                            .font(.system(size: 13, weight: .regular))
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                        }, label: {
                            DirectRegisterBookButton()
                        })
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 40)
                }
                .scrollIndicators(.hidden)
            }
            .background(.backLighter)
        }
        .navigationBarBackButtonHidden()
        .onChange(of: selectedBookID) { newValue in
            if let newValue = newValue {
                selectedBook = router.bookList?.first { $0.isbn == newValue }
                if let selectedBook = selectedBook {
                    let newBook = createBook(from: selectedBook)
                    homeViewModel.selectBookData(newBook)
                }
            } else {
                selectedBook = nil
                homeViewModel.selectedBookData = nil
            }
            bookSelected = newValue != nil
        }
    }
    
    private func createBook(from document: Documents) -> BookData {
        let newBookData = BookData()
        newBookData.title = document.title
        newBookData.thumbnail = document.thumbnail
        newBookData.publisher = document.publisher
        newBookData.publishedDate = convertToDate(from: document.datetime) ?? Date()
        newBookData.authors = document.authors.joined(separator: ",")
        newBookData.registerDate = Date()
        return newBookData
    }
}

func convertToDate(from dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.date(from: dateString)
}


func SearchBookProgressBar(process: CGFloat) -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 4 * process, height: 2)
                .background(.greenMain100)
        }
}

func DirectRegisterBookButton() -> some View {
    return RoundedRectangle(cornerRadius: 29)
        .stroke(.greenMain100, lineWidth: 1.0)
        .frame(width: 120 ,height: 32)
        .overlay {
            Text("+  직접 추가하기")
                .foregroundStyle(.greenMain100)
                .font(.system(size: 13, weight: .regular))
                .padding(.horizontal, 10)
        }
}

#Preview {
    SearchBook(homeViewModel: HomeViewModel())
}
