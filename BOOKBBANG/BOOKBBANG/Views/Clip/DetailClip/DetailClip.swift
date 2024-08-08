//
//  DetailClip.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import SwiftUI

struct DetailClip: View {
    @Environment(\.dismiss) var dismiss
    @State var showingSheet: Bool = false
    
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
                    DetailClipProfile()
                        .padding(.top, 20)
                    
                    HStack {
                        Text("총 2개")
                            .font(.system(size: 13, weight: .regular))
                            .padding(.leading, 30)
                            .foregroundStyle(.typo50)
                        
                        Spacer()
                    }
                    .padding(.bottom, 12)
                    
                    ForEach(0..<4, id: \.self) { _ in
//                        PhraseCard(display: .detailClip)
//                            .padding(.horizontal, 2)
//                            .padding(.bottom, 1)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $showingSheet) {
            EditClip()
        }
    }
}

#Preview {
    DetailClip()
}
