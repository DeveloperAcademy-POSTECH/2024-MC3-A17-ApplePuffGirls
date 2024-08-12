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
    
    var phraseCount: Int {
        countPhrasesContainingClip(clip: clip, context: viewContext)
    }
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "클립 상세정보",
                                rightTitle: "수정",
                                onChevron: { dismiss() },
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
                    
                    VStack(spacing: 2) {
                        ForEach(clip.phrases?.allObjects as! [Phrase], id: \.self) { phrase in
                            PhraseCard(display: .detailClip, phrase: phrase)
                                .padding(.horizontal, 2)
                                .padding(.bottom, 1)
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
