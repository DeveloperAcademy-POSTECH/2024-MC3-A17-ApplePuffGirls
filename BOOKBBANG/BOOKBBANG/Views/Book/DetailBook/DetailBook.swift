//
//  DetailBook.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct DetailBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    @ObservedObject var book: Book
    
    @State private var isEditBookPresented: Bool = false
    @State private var showDeleteAlert: Bool = false
    @State private var selectedDeletePhrase: Phrase?
    
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
                    
                    let phrases = book.phrases?.allObjects as? [Phrase]
                    
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
                            .padding(.bottom, phrases?.count == 0 ? 0 : 27)
                            
                            if phrases?.count == 0 {
                                HStack {
                                    Spacer()
                                    Image(.induceAddPhrase)
                                        .padding(.trailing, 150)
                                }
                            }
                            else {
                                if let phrases = phrases {
                                    ForEach(phrases, id: \.self) { phrase in
                                        NavigationLink(destination: {
                                            DetailPhrase(phrase: phrase)
                                        }, label: {
                                            PhraseCard(display: .detailBook, phrase: phrase)
                                                .contextMenu {
                                                    Button(role: .destructive) {
                                                        selectedDeletePhrase = phrase
                                                        showDeleteAlert = true
                                                    }
                                                    label: {
                                                        Label("삭제하기", systemImage: "trash")
                                                    }
                                                }
                                                .alert(Text("삭제하면 해당 구절은 되돌릴 수 없습니다."), isPresented: $showDeleteAlert, actions: {
                                                    if let phrase = selectedDeletePhrase {
                                                        alertView(phrase: phrase)
                                                    }
                                                }, message: { Text("구절을 삭제하시겠습니까?")})
                                        })
                                    }
                                    .padding(.horizontal, 5)
                                }
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
                }
            }
        }
    }
    
    @ViewBuilder
    private func alertView(phrase: Phrase) -> some View {
        Button("취소", role: .cancel) { }
        Button("삭제하기", role: .destructive) { deletePhrase(phrase: phrase) }
    }
    
    private func deletePhrase(phrase: Phrase) {
        viewContext.delete(phrase)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
