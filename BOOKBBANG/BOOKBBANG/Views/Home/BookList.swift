//
//  BookList.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/30/24.
//
// 메인화면에 보이는 책별 리스트 화면입니다.

import SwiftUI

struct BookList: View {
    
    enum Display {
        case main
        case recipt
    }
    
    @State var display: Display = .main
    
    @State var sort: SortBookBy = .recentRegister
    
    var bookImages: [String] = [
        "fish_1", "fish_2", "fish_3", "fish_4", "fish_6"
    ]
    @State var rankedBooks: [String] = []
    let columns = [
        GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // 정렬 버튼
            if display == .main {
                SortingBookPicker(sort: $sort)
            }
            
            LazyVGrid(columns: columns, spacing: 12) {
                if display == .main {
                    NavigationLink {
                        SearchBook()
                    } label: {
                        // 책 api 이미지 높이를 몰라서 임시로 155로 넣음
                        EmptyBox(width: 105, height: 155)
                    }
                }
                
                ForEach(bookImages, id: \.self) { image in
                    if display == .main {
                        NavigationLink {
                            Text(image)
                        } label: {
                            BookImage(image: image)
                        }
                        
                    } else {
                        Button {
                            if rankedBooks.count < 3 {
                                rankedBooks.append(image)
                            }
                        } label: {
                            BookImage(image: image)
//                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.greenMain100, lineWidth: 2))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookList(display: .recipt)
        .padding(.horizontal,2)
}


struct BookImage: View {
    @State var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
        // 책 api 이미지 높이를 몰라서 임시로 155로 넣음
            .frame(width: 105, height: 155)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
