//
//  RankingPhrases.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingPhrases: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("인상깊은 문구들을 선택해주세요")
            
            Text("어떤 책을 고르는 게 도움되는 지 알려주는 그런 문구 넣고 싶다 선택한 책을 취소하고 싶을 땐 다시 클릭해보세요")
            
            VStack(spacing: 13) {
                ForEach(1..<4) { i in
                    EmptyBox(width: 330, height: 46, text: "\(i)위", isButton: false)
                }
            }
            
            ScrollView {
                Text("당신이 누군가를 죽였다")
                PhraseCard(display: .detailBook)
                PhraseCard(display: .detailBook)
            }
        }
        
    }
}

#Preview {
    RankingPhrases()
}
