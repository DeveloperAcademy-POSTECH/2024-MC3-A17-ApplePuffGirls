//
//  SearchBook.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI
import UIKit

struct SearchBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var router = SearchRouter()
    @State private var searchText: String = ""
    @State private var selectedBookID: String? = nil
    @State private var bookSelected: Bool = false
    @State private var selectedBook: Documents?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: $bookSelected,
                                    navigationType: .chevron,
                                    title: "책 검색",
                                    rightTitle: "다음")
                
                SearchBookProgressBar()
                    .padding(.bottom, 30)
                
                Button(action: {
                    if let selectedBook = selectedBook {
                        addBook(book: selectedBook)
                    }
                }, label: {
                    Image(systemName: "heart")
                })
                
                SearchBookSearchBar(searchText: $searchText, searchRouter: router)
                    .padding(.horizontal, 22)
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
                        Text("혹시 원하는 책이 없나요?")
                            .foregroundStyle(.typo50)
                            .font(.system(size: 13, weight: .regular))
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            VStack {
                                Text("쨔자잔")
                                    .bold()
                                
                                Image(.gentlemangyodong)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
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
            } else {
                selectedBook = nil
            }
            bookSelected = newValue != nil
        }
    }
    
    private func addBook(book: Documents) {
        withAnimation {
            let newBook = Book(context: viewContext)
            if let selectedBook = selectedBook {
                newBook.name = selectedBook.title
                newBook.thumbnail = selectedBook.thumbnail
                newBook.publisher = selectedBook.publisher
                newBook.publishedDate = convertToDate(from: selectedBook.datetime)
                newBook.author = selectedBook.authors.joined(separator: ",")
                newBook.registerDate = Date()
                
                print("selectedBook: \(selectedBook)")
                print("newBook: \(newBook)")
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

func convertToDate(from dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.date(from: dateString)
}


func SearchBookProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 3, height: 2)
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
    SearchBook()
}
