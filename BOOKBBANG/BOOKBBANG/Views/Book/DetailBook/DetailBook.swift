//
//  DetailBook.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct DetailBook: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var isEditBookPresented: Bool = false
    
    @Binding var book: Book
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .chevron,
                                    title: "책 상세정보",
                                    rightTitle: "수정",
                                    onChevron: { homeViewModel.transition(to: .home) },
                                    onRightButton: { isEditBookPresented.toggle() })
                
                ScrollView {
                    VStack(spacing: 2) {
                        BookInfo(book: book)
                        
                        HStack(alignment: .bottom, spacing: 0) {
                            
                            HStack(spacing: 0) {
                                Text("총 ")
                                    .font(.bookCaption)
                                Text("\(book.phraseCount)")
                                    .font(.bookCaptionBold)
                                Text("개")
                                    .font(.bookCaption)
                            }
                            Spacer()
                            
                            NavigationLink(destination: {
                                AddPhrase(book: book)
                            }, label: {
                                Text("+  구절 추가하기")
                                    .font(.bookCaption)
                                    .frame(width: 118, height: 40)
                                    .foregroundStyle(.white)
                                    .background(Capsule().foregroundStyle(.greenMain100))
                            })
                        }
                        .foregroundStyle(.typo50)
                        .padding(.horizontal, 26)
                        .padding(.bottom, 27)
                        
                        ForEach(0..<3, id: \.self) { _ in
                            NavigationLink(destination: {
                                DetailPhrase()
                            }, label: {
                                PhraseCard()
                            })
                        }
                        .padding(.horizontal, 2)
                    }
                }
                .scrollIndicators(.hidden)
                .sheet(isPresented: $isEditBookPresented) {
                    EditBook(isPresented: $isEditBookPresented,
                             book: $book)
                }
            }
            .navigationBarBackButtonHidden()
            .background(.backLighter)
        }
    }
}
