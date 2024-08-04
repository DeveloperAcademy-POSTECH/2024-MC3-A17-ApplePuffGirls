//
//  RankingBooks.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingBooks: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("인상깊은 책들을 선택해주세요")
            
            Text("카테고리에 맞는 클립을 선택해보세요. (복수선택 가능) 다시 클립을 바꿀 수 있어요.")
            
            HStack(spacing: 14) {
                ForEach(1..<4) { i in
                    EmptyBox(width: 106, height: 155, text: "\(i)위", isButton: false)
                }
            }
            
            ScrollView {
                Text("내가 읽은 책빵 목록")
                ImagesContainer()
            }
        }
        .navigationTitle("책 순위 선정하기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RankingBooks()
    }
}
