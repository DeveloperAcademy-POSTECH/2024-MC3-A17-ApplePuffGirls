//
//  SearchBook.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI
import UIKit

struct SearchBook: View {
    @StateObject var router = SearchRouter()
    @State private var searchText: String = ""
    @State private var selectedBookID: String? = nil
    @State private var bookSelected: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: $bookSelected,
                                    navigationType: .chevron,
                                    title: "책 검색",
                                    rightTitle: "다음")
                
                SearchBookProgressBar()
                    .padding(.bottom, 30)
                
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
            bookSelected = newValue != nil
        }
    }
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
