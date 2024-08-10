//
//  ClipsInPhrase.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/9/24.
//

import SwiftUI

struct ClipsInPhrase: View {
    var clips: [Clip]
    var body: some View {
        HStack {
            AnyLayout(FlowLayout(spacing: 8)) {
                ForEach(clips, id: \.self) { clip in
                    HStack(spacing: 3) {
                        // 클립 이미지
                        Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                            .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                        
                        Text(clip.title ?? "no name")
                            .font(.phraseBottom)
                            .foregroundStyle(.typo100)
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 25)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}
