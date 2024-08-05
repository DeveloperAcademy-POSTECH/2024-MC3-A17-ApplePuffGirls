//
//  AddPhraseHeader.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI

struct AddPhraseHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundStyle(.greenMain100)
            
            Spacer()
            
            Text("문구 추가하기")
                .foregroundStyle(.typo100)
                .font(.system(size: 18, weight: .semibold))
                .kerning(-0.4)
            
            Spacer()
            
            Text("다음")
                .foregroundStyle(.typo25)
                .font(.system(size: 17, weight: .bold))
                .kerning(-0.4)
        }
        .padding(.horizontal, 23)
        .frame(height: 55)
        .background(.backLighter)
    }
}


#Preview {
    AddPhraseHeader()
}
