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
                        Image(ClipItem.getClipShape(clip.design))
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                            .foregroundStyle(Colors.getClipColor(clip.color))
                            .overlay {
                                Image(ClipItem.getClipBackgroundShape(clip.design))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 23, height: 23)
                            }
                        
                        if let title = clip.title {
                            Text(title)
                                .font(.phraseBottom)
                                .foregroundStyle(.typo100)
                        }
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
