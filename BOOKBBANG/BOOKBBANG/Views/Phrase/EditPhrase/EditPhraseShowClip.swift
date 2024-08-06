//
//  EditPhraseShowClip.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/6/24.
//

import SwiftUI

struct EditPhraseShowClip: View {
    let genreImages: [String] = ["fish_1", "fish_2", "fish_3", "fish_4"]
    let titles: [String] = ["안녕하세요저는제리입니다.", "안녕하세요저는제리입니다2", "클립 제목3", "클립 제목4"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("빵 클립")
                .font(.bookCaption)
                .foregroundColor(.typo50)
                .padding(.leading, 12)
                .padding(.bottom, 5)
            
            HStack {
                EditPhraseClipSmallList(
                    items: [
                        ChipsType(cliptitle: "안녕구리스 내이름은김리야 반가워", clippriority: 1, clipimage: "fish_1"),
                        ChipsType(cliptitle: "클립 제목2", clippriority: 2, clipimage: "fish_2"),
                        ChipsType(cliptitle: "클립 제목3", clippriority: 3, clipimage: "fish_3"),
                        ChipsType(cliptitle: "클립 제목4", clippriority: 4, clipimage: "fish_4")
                    ]
                )
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 8, height: 15)
                    .foregroundColor(.greenMain100)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.typo10))
            }
        }
    }



#Preview {
    EditPhraseShowClip()
}
