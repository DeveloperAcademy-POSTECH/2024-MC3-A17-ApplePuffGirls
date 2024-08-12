//
//  RankingBooks.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingBooks: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeViewModel: HomeViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.registerDate, ascending: false)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    @Binding var rankedBooks: [Book]
    @State var tempRankedBooks: [Book] = []
    
    var isCompleted: Bool {
        return !tempRankedBooks.isEmpty
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(isCompleted),
                                navigationType: .chevron,
                                title: "책 순위 선정하기", 
                                rightTitle: "다음", 
                                onChevron: { dismiss() },
                                onRightButton: {
                rankedBooks = tempRankedBooks
                dismiss()
            })
            
            VStack {
                HeaderSection(title: "인상깊은 책들을 선택해주세요", 
                              subtitle: "오래 기억하고 싶은 책이 있나요? 순위를 매겨보세요.")
                
                HStack(spacing: 14) {
                    ForEach(1..<4) { i in
                        if tempRankedBooks.count >= i {
                            fetchHomeImage(url: tempRankedBooks[i-1].thumbnail ?? "")
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
                                    if tempRankedBooks.contains(book) {
                                        tempRankedBooks.removeAll(where: { $0 == book })
                                    } else if tempRankedBooks.count < 3 {
                                        tempRankedBooks.append(book)
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
    }
}

