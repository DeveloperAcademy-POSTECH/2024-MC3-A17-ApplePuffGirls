//
//  AddPhraseTextfield.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//  Coding teacher : Ian

import SwiftUI



struct AddPhraseTextfield: View {
    @Binding var checkEmpty: Bool
    @Binding var page: String
    @Binding var phrase: String
    
    var body: some View {
        createTextEditor()
            .onChange(of: page) { _ in
                validateFields()
            }
            .onChange(of: phrase) { _ in
                validateFields()
            }
    }
}

extension AddPhraseTextfield {
    func createTextEditor() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("페이지")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            TextField("", text: $page)
                .padding(.horizontal,16)
                .padding(.vertical,14)
                .background(.typo10)
                .frame(height: 46)
                .keyboardType(.decimalPad)
                .cornerRadius(10)
                .font(.system(size: 15, weight: .regular))
                .kerning(-0.4)
                .foregroundStyle(.typo100)
            
            Spacer().frame(height: 22)
            
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
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.typo100)
                        .lineSpacing(10)
                }
        }
    }
    
    private func validateFields() {
        checkEmpty = !page.isEmpty && !phrase.isEmpty
    }
}
