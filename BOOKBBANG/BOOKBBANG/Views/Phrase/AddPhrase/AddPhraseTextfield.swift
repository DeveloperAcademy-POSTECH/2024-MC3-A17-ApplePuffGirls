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
            Text("조각 페이지")
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
            
            Text("내가 자른 조각")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            Rectangle()
                .fill(.typo10)
                .frame(height: 150)
                .cornerRadius(10)
                .overlay(alignment: .topLeading) {
                    TextField("마음에 와닿은 문구를 적어보세요", text: $phrase)
                        .padding(.top)
                        .padding(.leading)
                }
        }
    }
}
