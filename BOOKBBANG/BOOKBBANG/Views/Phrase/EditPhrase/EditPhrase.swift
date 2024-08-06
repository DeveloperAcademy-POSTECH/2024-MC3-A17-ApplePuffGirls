//
//  EditPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/5/24.
//

import SwiftUI

struct EditPhrase: View {
    @State private var phrase: String = ""
    @State private var mythought: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .cancel,
                                title: "빵 수정하기",
                                rightTitle: "저장")
            .padding(.bottom, 20)
            
            editField(title: "내가 구운 빵", text: $phrase)
                .padding(.bottom, 22)
            
            EditPhraseShowClip()
                .padding(.bottom, 22)
            
            editField(title: "빵 속에 담긴 나의 생각", text: $mythought)
        }
        .padding(.horizontal, 22)
        .background(Color.backLighter)
    }
}

extension EditPhrase {
    private func editField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.typo10)
                .overlay(
                    TextEditor(text: text)
                        .scrollContentBackground(.hidden)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                )
        }
    }
}

#Preview {
    EditPhrase()
}
