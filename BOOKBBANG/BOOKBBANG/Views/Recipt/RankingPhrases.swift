//
//  RankingPhrases.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingPhrases: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "책 순위 선정하기", rightTitle: "다음")
            
            HeaderSection(title: "인상깊은 문구들을 선택해주세요", subtitle: "어떤 책을 고르는 게 도움되는 지 알려주는 그런 문구 넣고 싶다 선택한 책을 취소하고 싶을 땐 다시 클릭해보세요")
            
            VStack(spacing: 13) {
                ForEach(1..<4) { i in
                    EmptyBox(width: 330, height: 46, text: "\(i)위", isButton: false)
                }
            }
            .padding(.vertical, 15)
            
            ScrollView {
                HStack {
                    Text("당신이 누군가를 죽였다")
                        .font(.listTitle)
                        .foregroundStyle(.typo100)
                    Spacer()
                    Text("문장 2개")
                        .font(.memberComment)
                        .foregroundStyle(.typo50)
                }
                .padding(.top, 30)
                .padding(.horizontal, 35)
                
                PhraseCard(display: .detailBook)
                PhraseCard(display: .detailBook)
            }
        }
        
    }
}

#Preview {
    RankingPhrases()
}
