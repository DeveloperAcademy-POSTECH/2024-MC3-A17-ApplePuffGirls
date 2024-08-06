//
//  DetailPhraseClipList.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/4/24.
//

import SwiftUI

struct DetailPhraseClipList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("빵 클립")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            
            EditPhraseClipSmallList(
                items: [
                    ChipsType(cliptitle: "클립 제목1", clippriority: 1, clipimage: "fish_1"),
                    ChipsType(cliptitle: "클립 제목2", clippriority: 2, clipimage: "fish_2"),
                    ChipsType(cliptitle: "클립 제목3", clippriority: 3, clipimage: "fish_3"),
                    ChipsType(cliptitle: "클립 제목4", clippriority: 4, clipimage: "fish_4")])
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.backDarker))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                .stroke(.typo25)
            }
        }
    }
}


#Preview {
    DetailPhraseClipList()
        .previewLayout(.sizeThatFits)
}
