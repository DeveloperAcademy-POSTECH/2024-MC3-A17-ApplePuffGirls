//
//  AddCategoryToPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/3/24.
//

import SwiftUI

struct AddCategoryToPhrase: View {
    @State var items: [String] = ["나의 행복한 빵먹기 생활", "행복한 문구", "힘이 되는 이야기들"]
    @State var selections: [String] = []
    @State private var clipSelected: Bool = false
    @State private var clipImage: [String] = ["fish_1", "fish_2", "fish_3"]

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted: $clipSelected,
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음")
            
            AddCategorytoPhraseProgressBar()
            
            Image(.baking3)
                .resizable()
                .scaledToFit()
                .frame(height: 90)
            
            Section {
                Text("빵을 어떤 클립에 담아둘까요?")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 10)
                Text("빵에 어울리는 클립을 선택해보세요. (복수 선택 가능)")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 20)
                    .lineSpacing(5)
            }
            .padding(.horizontal, 22)
            
            MultipleSelectionList(items: $items, 
                                  clipImage: $clipImage,
                                  selections: $selections)
            
            NewClipButton()
            
            Spacer()
        }
    }
}

#Preview {
    AddCategoryToPhrase()
}


func AddCategorytoPhraseProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 3 * 2 , height: 2)
                .background(.greenMain100)
        }
}

#Preview {
    AddCategoryToPhrase()
}
