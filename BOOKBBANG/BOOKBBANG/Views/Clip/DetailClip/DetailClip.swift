//
//  DetailClip.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import SwiftUI

struct DetailClip: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject var clip: Clip
    
    @State var showingSheet: Bool = false
    @State private var showDeletePhraseAlert: Bool = false
    @State private var showDeleteClipAlert: Bool = false
    
    var phraseCount: Int {
        countPhrasesContainingClip(clip: clip, context: viewContext)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        DetailClipProfile(clip: clip)
                            .padding(.top, 20)
                        
                        HStack {
                            Text("총 \(clip.phrases?.count ?? 0)개")
                                .font(.system(size: 13, weight: .regular))
                                .padding(.leading, 30)
                                .foregroundStyle(.typo50)
                            
                            Spacer()
                        }
                        .padding(.bottom, 12)
                        
                        VStack(spacing: 0) {
                            if let count = clip.phrases?.count, count == 0 {
                                VStack {
                                    Image(.mustache)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 160)
                                        .padding(.bottom, 20)
                                    
                                    Text("문장을 추가하러 가볼까요?")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundStyle(.typo80)
                                }
                                .padding(.vertical, 50)
                            }
                            else if let phrases = clip.phrases?.allObjects as? [Phrase] {
                                ForEach(phrases, id: \.self) { phrase in
                                    NavigationLink(destination: {
                                        DetailPhrase(phrase: phrase)
                                    }, label: {
                                        PhraseCard(display: .detailClip, phrase: phrase)
                                            .padding(.horizontal, 5)
                                            .padding(.bottom, 3)
                                            .contextMenu {
                                                Button(role: .destructive) {
                                                    showDeletePhraseAlert = true
                                                }
                                                label: {
                                                    Label("삭제하기", systemImage: "trash")
                                                }
                                            }
                                            .alert(Text("삭제하면 해당 구절은 되돌릴 수 없습니다."), isPresented: $showDeletePhraseAlert, actions: {
                                                alertView(phrase: phrase)
                                            }, message: { Text("구절을 삭제하시겠습니까?")})
                                    })
                                }
                            }
                            
                            Spacer()

                            Button(action: {
                                showDeleteClipAlert = true
                            }, label: {
                                Text("클립 삭제하기")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.clipRed)
                            })
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .background(.backLighter)
            .navigationTitle("클립 상세정보")
            .toolbarRole(.editor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                        Text("수정")
                            .fontWeight(.bold)
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                EditClip(clip: clip)
            }
            .alert(Text("삭제하면 해당 클립은 되돌릴 수 없습니다."), isPresented: $showDeleteClipAlert, actions: {
                alertView(clip: clip)
            }, message: { Text("클립을 삭제하시겠습니까?")})
        }
    }
    
    @ViewBuilder
    private func alertView(phrase: Phrase) -> some View {
        Button("취소", role: .cancel) { }
        Button("삭제하기", role: .destructive) { deletePhrase(phrase: phrase) }
    }
    
    @ViewBuilder
    private func alertView(clip: Clip) -> some View {
        Button("취소", role: .cancel) { }
        Button("삭제하기", role: .destructive) { deleteClip(clip: clip) }
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
    
    private func deleteClip(clip: Clip) {
        viewContext.delete(clip)
        dismiss()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
