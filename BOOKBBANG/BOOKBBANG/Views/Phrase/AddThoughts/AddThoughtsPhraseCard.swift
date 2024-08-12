//
//  AddThoughtsPhraseCard.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/9/24.
//

import SwiftUI

struct AddThoughtsPhraseCard: View {
    @Binding var phraseData: PhraseData
    
    var body: some View {
        HStack(spacing: 0) {
            Text(phraseData.content)
                .font(.bookk15)
                .lineSpacing(10)
                .foregroundStyle(.typo80)
            Spacer()
        }
        .padding(.vertical, 26)
        .padding(.horizontal, 30)
        .multilineTextAlignment(.leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.backDarker)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.typo25)
                .frame(maxWidth: .infinity)
        }
        
    }
}
