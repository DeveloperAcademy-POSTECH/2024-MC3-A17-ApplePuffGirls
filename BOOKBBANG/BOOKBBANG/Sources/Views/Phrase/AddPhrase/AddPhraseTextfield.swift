//
//  AddPhraseTextfield.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//  Coding teacher : Ian

import SwiftUI



struct AddPhraseTextfield: View {
    @Binding var checkEmpty: Bool
    @Binding var phrase: String
    
    var body: some View {
        createTextEditor()
            .onChange(of: phrase) { _ in
                validateFields()
            }
    }
}

extension AddPhraseTextfield {
    func createTextEditor() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("내가 구울 빵")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.typo10)
                .overlay(alignment: .topLeading) {
                    TextEditor(text: $phrase)
                        .scrollContentBackground(.hidden)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .font(.bookk15)
                        .foregroundStyle(.typo100)
                        .lineSpacing(10)
                }
        }
    }
    
    private func validateFields() {
        checkEmpty = !phrase.isEmpty
    }
}
