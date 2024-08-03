//
//  AddPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI

struct AddPhrase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            AddPhraseHeader()
            
            AddPhraseProgressBar()
            
            Spacer() .frame(height: 132)
            
            Section {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .foregroundStyle(.greenMain40)
                        .frame(height: 14)
                        .padding(.bottom, -10)
                    
                    Text("\"당신이 누군가를 죽였다\"")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.bottom, 3)
                } 
                .fixedSize()
                
                Text("이 책빵의 어느 부분을 잘라볼까요?")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 10)
                
                Text("책에서 마음에 와닿았던 구절을 적어주세요")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 20)
                
                Spacer() .frame(height: 22)
                
                AddPhraseTextfield()
                
            }
            .padding(.horizontal, 22)
            
            Spacer()
            
        }
        .background(.backLighter)
    }
}

func AddPhraseProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 3, height: 2)
                .background(.greenMain100)
        }
}

#Preview {
    AddPhrase()
}