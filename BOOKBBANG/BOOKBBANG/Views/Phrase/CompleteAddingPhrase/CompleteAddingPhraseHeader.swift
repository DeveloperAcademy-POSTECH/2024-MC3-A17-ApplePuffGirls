//
//  CompleteAddingPhraseHeader.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/6/24.
//

import SwiftUI

struct CompleteAddingPhraseHeader: View {
    var title: String
    var onComplete: (() -> Void)?
    
    var body: some View {
            HStack {
                Text("완료")
                    .foregroundStyle(.backLighter)
                    .font(.system(size: 17, weight: .bold))
                    .kerning(-0.4)
                
                Spacer()

                Text(title)
                    .foregroundStyle(.typo100)
                    .font(.system(size: 18, weight: .semibold))
                    .kerning(-0.4)

                Spacer()

                Button(action: {
                    onComplete?()
                }, label: {
                    Text("완료")
                        .foregroundStyle(.greenMain100)
                        .font(.system(size: 17, weight: .bold))
                        .kerning(-0.4)
                })
                
            }
            .padding(.horizontal, 23)
            .frame(height: 55)
            .background(.backLighter)
        }
}
