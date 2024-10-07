//
//  DetailBook.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct DetailBook: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    @State private var isEditBookPresented: Bool = false
    
    @ObservedObject var book: Book
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                                
                                Button(action: {
                                    detailBookViewModel.transition(to: .addPhrase)
                                }, label: {
                                    Text("빵 추가하기")
                                        .font(.bookCaption)
                                        .frame(width: 120, height: 32)
                                        .foregroundColor(.greenMain100)
                                        .background(Capsule().fill(.clear))
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.greenMain100, lineWidth: 1)
                                        )
                                })
                            }
                            .foregroundStyle(.typo50)
                            .padding(.horizontal, 26)
                            .padding(.bottom, 27)
                            
                            if let phrases = book.phrases?.allObjects as? [Phrase] {
                                ForEach(phrases, id: \.self) { phrase in
                                    Button {
                                        detailBookViewModel.newPhrase = phrase
                                        detailBookViewModel.transition(to: .detailPhrase)
                                    } label: {
                                        PhraseCard(display: .detailBook, phrase: phrase)
                                    }
                                }
                                .padding(.horizontal, 2)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .sheet(isPresented: $isEditBookPresented) {
                        EditBook(book: book)
                    }
                }
                .navigationBarBackButtonHidden()
                .background(.backLighter)
                
                switch detailBookViewModel.viewStatus {
                case .detailBook:
                    EmptyView()
                case .addPhrase:
                    AddPhrase(detailBookViewModel: detailBookViewModel, book: book)
                case .addThoughts:
                    if let newPhraseData = detailBookViewModel.newPhraseData {
                        AddThoughts(detailBookViewModel: detailBookViewModel, phraseData: .constant(newPhraseData))
                    }
                case .addClipToPhrase:
                    if let newPhraseData = detailBookViewModel.newPhraseData {
                        AddCategoryToPhrase(detailBookViewModel: detailBookViewModel, phraseData: .constant(newPhraseData))
                    }
                case .addClipFinal:
                    CompleteAddingPhrase(detailBookViewModel: detailBookViewModel, book: book)
                case .detailPhrase:
                    if let newPhrase = detailBookViewModel.newPhrase {
                        DetailPhrase(phrase: newPhrase)
                            .environmentObject(detailBookViewModel)
                    }
                }
            }
        }
    }
}
