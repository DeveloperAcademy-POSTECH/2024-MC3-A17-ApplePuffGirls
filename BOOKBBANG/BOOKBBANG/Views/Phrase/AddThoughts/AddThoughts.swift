//
//  AddThoughts.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI

struct AddThoughts: View {
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    @State private var checkEmpty: Bool = false
    @State private var thought: String = ""
    
    @Binding var phrase: Phrase
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: $checkEmpty,
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음",
                                onChevron: { detailBookViewModel.transition(to: .addPhrase) },
                                onRightButton: { clickRightButton() })
            
            AddThoughtsProgressBar()
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Image(.baking1)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundStyle(.greenMain40)
                            .frame(height: 14)
                            .padding(.bottom, -10)
                        
                        if let title = phrase.book?.name {
                            Text("\"\(title)\"")
                                .foregroundStyle(.typo100)
                                .font(.system(size: 24, weight: .bold))
                                .padding(.bottom, 3)
                                .frame(maxWidth: UIScreen.main.bounds.width - 46)
                                .lineLimit(1)
                        }
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
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal, 22)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("내가 구운 빵")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 8)
                    .padding(.leading, 30)
                
                if let phrase = detailBookViewModel.newPhrase {
                    PhraseCard(display: .addPhrase, phrase: phrase)
                        .padding(.horizontal, 2)
                }
                
                Spacer().frame(height: 22)
                
                AddThoughtsTextfield(checkEmpty: $checkEmpty, 
                                     thought: $thought)
                    .padding(.horizontal, 22)
            }
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        phrase.thinking = thought
        phrase.createdDate = .now
        detailBookViewModel.addPhrase(phrase)
        
        detailBookViewModel.transition(to: .addClipToPhrase)
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
}
