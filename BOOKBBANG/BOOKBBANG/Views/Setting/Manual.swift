
//
//  Manual.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct Manual: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .chevron,
                                    title: "책빵 사용설명서",
                                    onChevron: { dismiss() })
                ScrollView {
                    Text("책빵장님, 책빵에 온 걸 환영해요!")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.greenMain100)
                        .kerning(-0.4)
                        .padding(.bottom, 20)
                    
                    ForEach(manualChapter, id: \.self) { manual in
                        ShowEachChapter(chapter: manual)
                            .padding(.bottom, 30)
                    }
                }
            }
            .background(.backLighter)
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden()
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
                    .frame(width: 150)
                    .padding(.bottom, 20)
                
                Text(chapter.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.greenMain100)
                    .padding(.bottom, 20)
                    .kerning(-0.4)
                
                Text(chapter.content)
                    .font(.system(size: 13, weight: .regular))
                    .kerning(-0.4)
                    .foregroundStyle(.typo80)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
    }
}
