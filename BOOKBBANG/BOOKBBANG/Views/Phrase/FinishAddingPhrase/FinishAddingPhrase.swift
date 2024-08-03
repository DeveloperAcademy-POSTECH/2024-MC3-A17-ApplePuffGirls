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
            
            FinishAddingPhraseHeader()
            
            Rectangle()
                .frame(width: .infinity, height: 2)
                .foregroundColor(.greenMain100)
            
            Rectangle()
                .foregroundColor(.backLighter)
                .edgesIgnoringSafeArea(.bottom)
            //일러스트 그리면 추가~.~
        }
    }
}

#Preview {
    FinishAddingPhrase()
}
