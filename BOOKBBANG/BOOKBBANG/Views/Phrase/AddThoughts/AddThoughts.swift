//
//  AddThoughts.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI

struct AddThoughts: View {
    @State private var clipSelected: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted: $clipSelected,
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음")
            
            AddThoughtsProgressBar()
            
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
                
                
                Text("이 빵에 어떤 생각을 담아볼까요?")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 10)
                Text("빵을 구운 이유를 나중에 쉽게 확인할 수 있어요")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, 22)
                
                Spacer() .frame(height: 21)
                
                Text("내가 구운 빵")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 8)
                    .padding(.leading, 30)
                
                PhraseCard(display: .addPhrase)
                    .padding(.horizontal, 2)
                
                Spacer().frame(height: 22)
                
                AddThoughtsTextfield()
                .padding(.horizontal, 22)   
            }
        }
    }

func AddThoughtsProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 2 , height: 2)
                .background(.greenMain100)
        }
}

#Preview {
    AddThoughts()
}
