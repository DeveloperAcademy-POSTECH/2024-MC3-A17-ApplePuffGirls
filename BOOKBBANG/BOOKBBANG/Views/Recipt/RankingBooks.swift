//
//  RankingBooks.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/3/24.
//

import SwiftUI

struct RankingBooks: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeViewModel: HomeViewModel
    @State var rankedBooks: [String] = []
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "책 순위 선정하기", 
                                rightTitle: "다음", 
                                onChevron: { dismiss() })
            
            VStack {
                HeaderSection(title: "인상깊은 책들을 선택해주세요", 
                              subtitle: "카테고리에 맞는 클립을 선택해보세요. (복수선택 가능) \n다시 클립을 바꿀 수 있어요.")
                
                HStack(spacing: 14) {
                    ForEach(1..<4) { i in
                        EmptyBox(width: 106, height: 155, text: "\(i)위", isButton: false)
                    }
                }
                .padding(.top, 30)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("내가 읽은 책빵 목록")
                            .font(.bookCaption)
                            .foregroundStyle(.typo50)
                            .padding(.vertical, 15)
                            .padding(.leading, 30)
                        
                        BookList(homeViewModel: homeViewModel, display: .recipt)
                    }
                }
            }
            .padding(.top, 30)
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
    }
}
//
//#Preview {
//    NavigationStack {
//        RankingBooks()
//    }
//}
