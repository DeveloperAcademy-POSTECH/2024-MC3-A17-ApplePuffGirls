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
    
    @State private var progress: Int = 1
    
    @ObservedObject var book: BookData = BookData()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: $bookSelected,
                                    navigationType: .chevron,
                                    title: "새로운 책 추가하기",
                                    rightTitle: "다음",
                                    onChevron: { clickBackButton() },
                                    onRightButton: { clickNextButton() })
                
                CustomProgressBar(process: $homeViewModel.progress, count: 3)
                    .padding(.bottom, 28)
                
                ScrollViewReader { proxy in
                    SearchBookSearchBar(searchText: $searchText, searchRouter: router, onScrollToTop: {
                        proxy.scrollTo(0, anchor: .top)
                    })
                    .padding(.bottom, 20)
                    
                    ScrollView {
                        Spacer().frame(height: 20)
                        
                        LazyVStack {
                            if let bookList = router.bookList {
                                ForEach(bookList.indices, id: \.self) { index in
                                    SearchBookListRow(selectedBookID: $selectedBookID,
                                                      book: bookList[index])
                                    .padding(.bottom, 10)
                                    .padding(.leading, 20)
                                    
                                    VStack{}
                                        .frame(maxWidth: UIScreen.main.bounds.width)
                                        .frame(height: 0.5)
                                        .background(.divider)
                                        .padding(.bottom, 10)
                                        .padding(.horizontal, 14)
                                        .id(index)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .scrollDismissesKeyboard(.immediately)
                }
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
    
    private func directRegisterBookButton() -> some View {
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
    
    private func clickBackButton() {
        homeViewModel.backProgress()
        homeViewModel.transition(to: .home)
    }
    
    private func clickNextButton() {
        homeViewModel.nextProgress()
        homeViewModel.transition(to: .addBook)
    }
}

func convertToDate(from dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.date(from: dateString)
}

#Preview {
    SearchBook(homeViewModel: HomeViewModel())
}

