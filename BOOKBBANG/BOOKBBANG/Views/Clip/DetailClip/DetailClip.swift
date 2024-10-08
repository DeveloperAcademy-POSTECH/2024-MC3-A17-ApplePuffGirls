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
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    @ObservedObject var clip: Clip
    @State var showingSheet: Bool = false
    
    var phraseCount: Int {
        countPhrasesContainingClip(clip: clip, context: viewContext)
    }
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "클립 상세정보",
                                rightTitle: "수정",
                                onChevron: {
                homeViewModel.transition(to: .home)
                homeViewModel.selectedClip = nil
            },
                                onRightButton: { showingSheet.toggle() })
            
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
                                    .frame(width: 200)
                                    .padding(.bottom, 20)
                                
                                Text("문장을 추가하러 가볼까요?")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.typo80)
                            }
                            .padding(.vertical, 50)
                        }
                        else if let phrases = clip.phrases?.allObjects as? [Phrase] {
                            ForEach(phrases, id: \.self) { phrase in
                                Button {
                                    detailBookViewModel.newPhrase = phrase
                                    detailBookViewModel.transition(to: .detailPhrase)
                                } label: {
                                    PhraseCard(display: .detailClip, phrase: phrase)
                                        .padding(.horizontal, 2)
                                        .padding(.bottom, 1)
                                }
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $showingSheet) {
            EditClip(clip: clip)
        }
    }
}
