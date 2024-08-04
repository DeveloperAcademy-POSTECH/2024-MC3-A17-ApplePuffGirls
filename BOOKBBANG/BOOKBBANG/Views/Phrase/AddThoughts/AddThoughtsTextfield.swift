//
//  AddThoughtsTextfield.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI

struct AddThoughtsTextfield: View {
    @State var thought: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("나의 생각")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.typo10)
                .overlay(alignment: .topLeading) {
                    TextEditor(text: $thought)
                        .scrollContentBackground(.hidden)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                }
        }
    }
}

#Preview {
    AddThoughtsTextfield()
}