//
//  DetailPhraseClipList.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/4/24.
//

import SwiftUI

struct DetailPhraseClipList: View {
    struct CategoryItem: Identifiable {
        let id = UUID()
        let image: Image
        let text: String
    }
    
    @State private var items: [CategoryItem] = [
        CategoryItem(image: Image(systemName: "star"), text: "행복한 나의 빵 먹기 생활"),
        CategoryItem(image: Image(systemName: "heart"), text: "Loved")
    ]
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("조각 카테고리")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            
            Color.backDarker
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(.typo25)
                }
                .frame(width: .infinity, height: 48)
                .overlay {
                    HStack {
                        ForEach(items) { item in
                            HStack(spacing: 8) {
                                item.image
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(item.text)
                                    .foregroundStyle(.typo100)
                                    .font(.system(size: 12))
                            }
                            .padding(.horizontal, 4)
                        }
                        Spacer()
                    }.padding(.leading, 10)
                }
        }
    }
}

#Preview {
    DetailPhraseClipList()
        .previewLayout(.sizeThatFits)
}
