//
//  MakingRecipt.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/6/24.
//

import SwiftUI

struct MakingRecipt: View {
    enum Display: Int {
        case rankingBooks = 0
        case rankingPhrases = 1
    }
    
    @State var display: Display = .rankingBooks
    
    var body: some View {
        CustomNavigationBar(isHighlighted: .constant(false),
                            navigationType: .chevron,
                            title: "책 순위 선정하기",
                            rightTitle: "다음", onRightButton: {
            
        }
        )
    }
}

#Preview {
    MakingRecipt()
}
