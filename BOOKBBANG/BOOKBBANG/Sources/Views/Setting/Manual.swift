
//
//  Manual.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct Manual: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    Text("책빵장님, 책빵에 온 걸 환영해요!")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.greenMain100)
                        .kerning(-0.4)
                        .padding(.vertical, 20)
                    
                    ForEach(manualChapter, id: \.self) { manual in
                        ShowEachChapter(chapter: manual)
                            .padding(.bottom, 50)
                    }
                }
            }
            .background(.backLighter)
            .scrollIndicators(.hidden)
        }
        .navigationTitle("책빵 사용설명서")
    }
}

struct ShowEachChapter: View {
    var chapter: ManualChapter
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Image(chapter.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: chapter.imageWidth)
                    .padding(.bottom, 40)
                
                Text(chapter.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.greenMain100)
                    .padding(.bottom, 20)
                    .kerning(-0.4)
                
                Text(chapter.content)
                    .font(.system(size: 13, weight: .regular))
                    .kerning(-0.4)
                    .lineSpacing(10)
                    .foregroundStyle(.typo80)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
    }
}
