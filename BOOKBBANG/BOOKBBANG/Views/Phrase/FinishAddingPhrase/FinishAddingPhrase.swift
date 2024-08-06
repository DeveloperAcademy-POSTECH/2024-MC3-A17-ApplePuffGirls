//
//  FinishAddingPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/3/24.
//

import SwiftUI

struct FinishAddingPhrase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            FinishingAddingPhraseHeader()
            
            Rectangle()
                .frame(width: .infinity, height: 2)
                .foregroundColor(.greenMain100)
            
            Spacer()
            //일러스트 그리면 추가~.~
        }
        .background(Color.backLighter)
    }
}

#Preview {
    FinishAddingPhrase()
}
