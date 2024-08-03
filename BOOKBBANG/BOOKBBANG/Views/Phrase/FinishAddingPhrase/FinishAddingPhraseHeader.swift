//
//  FinishAddingPhraseHeader.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/3/24.
//

import SwiftUI

struct FinishAddingPhraseHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundStyle(.greenMain100)
            
            Spacer()
            
            Text("빵굽기 완료")
                .foregroundStyle(.typo100)
                .font(.system(size: 18, weight: .semibold))
                .kerning(-0.4)
            
            Spacer()
            
            Text("완료")
                .foregroundStyle(.greenMain100)
                .font(.system(size: 17, weight: .bold))
                .kerning(-0.4)
        }
        .padding(.horizontal, 23)
        .frame(height: 55)
        .background(.backLighter)
    }
}

#Preview {
    FinishAddingPhraseHeader()
}
