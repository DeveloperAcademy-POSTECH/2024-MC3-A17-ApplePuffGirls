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
    var bookImages: [String] = [
        "fish_1", "fish_2", "fish_3", "fish_4", "fish_6"
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // 정렬 버튼
            SortingBookPicker(sort: $sort)
            
            LazyVGrid(columns: columns, spacing: 12) {
                NavigationLink {
                    SearchBook()
                } label: {
                    EmptyBox(width: 105, height: 155)
                }
                ForEach(bookImages, id: \.self) { image in
                    NavigationLink {
                        Text(image)
                    } label: {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 105, height: 155)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    BookList()
        .padding(.horizontal,2)
}

