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
            
            Rectangle()
                .fill(.typo10)
                .frame(height: 150)
                .cornerRadius(10)
                .overlay(alignment: .topLeading) {
                    TextField("자신의 생각을 적어보세요", text: $thought)
                        .padding(.top)
                        .padding(.leading)
                }
        }
    }
}

#Preview {
    AddThoughtsTextfield()
}
