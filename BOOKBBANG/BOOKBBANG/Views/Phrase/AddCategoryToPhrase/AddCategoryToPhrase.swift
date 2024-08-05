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
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
             CustomNavigationBar(isHighlighted: $clipSelected,
                                    navigationType: .chevron,
                                    title: "카테고리 지정하기",
                                    rightTitle: "다음")
            
            AddCategorytoPhraseProgressBar()
            
            Spacer() .frame(height: 132)
            
            Section {
                Text("빵을 어떤 클립에 담아둘까요?")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 10)
                Text("카테고리에 맞는 클립을 선택해보세요. 복수 선택 가능해요.\n다시 클립을 바꿀 수 있어요.")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 20)
                    .lineSpacing(5)
            }
            .padding(.horizontal, 22)
            
            VStack(alignment: .leading, spacing: 0) {
                MultipleSelectionList()
                
                NewClipButton()
            }
            Spacer()
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Rectangle()
                    .frame(width: 55, height: 55)
                    .foregroundStyle(.typo50)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.listTitle)
                        .foregroundColor(.typo100)
                        .padding(.bottom, 2)
                    
                    Text("구절 8개")
                        .font(.phraseBottom)
                        .foregroundStyle(.typo50)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.greenMain100)
                }
            }
            .padding() // 선택 사항: 레이아웃에 여유를 추가
        }
    }
}

extension AddCategoryToPhrase {
    func MultipleSelectionList() -> some View {
        VStack(alignment: .leading) {
            ForEach(Array(items.enumerated()), id: \.element) { index, item in
                MultipleSelectionRow(
                    title: item,
                    isSelected: self.selections.contains(item),
                    action: {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                        } else {
                            self.selections.append(item)
                        }
                    }
                )
                if index < items.count - 1 {
                    Divider() // Add this line to include a separator
                        .padding(.vertical,2)
                }
            }
        }
    }
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
