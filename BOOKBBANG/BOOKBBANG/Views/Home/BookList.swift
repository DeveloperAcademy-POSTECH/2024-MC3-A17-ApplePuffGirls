//
//  BookList.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 메인화면에 보이는 책별 리스트 화면입니다.

import SwiftUI

struct BookList: View {
    @State var sort: SortBookBy = .recentRegister
    
    var body: some View {
        VStack(spacing: 0) {
            // 정렬 버튼
            SortingBookPicker(sort: $sort)
            
            ImagesContainer()
                .padding(.horizontal, 22)
        }
    }
}

#Preview {
    BookList()
        .padding(.horizontal,2)
}

