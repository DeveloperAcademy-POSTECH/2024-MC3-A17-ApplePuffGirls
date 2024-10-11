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
    @State private var showDeleteAlert: Bool = false
    
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
                                            .padding(.horizontal, 2)
                                            .padding(.bottom, 1)
                                            .contextMenu {
                                                Button(role: .destructive) {
                                                    showDeleteAlert = true
                                                }
                                                label: {
                                                    Label("삭제하기", systemImage: "trash")
                                                }
                                            }
                                            .alert(Text("삭제하면 해당 구절은 되돌릴 수 없습니다."), isPresented: $showDeleteAlert, actions: {
                                                alertView(phrase: phrase)
                                            }, message: { Text("구절을 삭제하시겠습니까?")})
                                    })
                                }
                            }
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
