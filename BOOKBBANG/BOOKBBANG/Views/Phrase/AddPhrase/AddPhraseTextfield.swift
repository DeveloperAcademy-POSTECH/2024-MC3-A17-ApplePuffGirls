//
//  AddPhraseTextfield.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//  Coding teacher : Ian

import SwiftUI



struct AddPhraseTextfield: View {
    @State var page: String = ""
    @State var phrase: String = ""
    
    var body: some View {
        createTextEditor()
    }
}

#Preview {
    AddPhraseTextfield()
}

extension AddPhraseTextfield {
    func createTextEditor() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("페이지")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            TextField("예시: 1", text: $page)
                .padding(.horizontal,16)
                .padding(.vertical,14)
                .background(Color(uiColor: .typo10))
                .frame(height: 46)
                .keyboardType(.decimalPad)
                .cornerRadius(10)
            
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
                }
        }
    }
}
