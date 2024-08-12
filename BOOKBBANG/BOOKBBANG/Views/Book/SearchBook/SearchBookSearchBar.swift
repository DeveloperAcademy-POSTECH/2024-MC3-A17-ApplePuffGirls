//
//  SearchBookSearchBar.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/31/24.
//

import SwiftUI

struct SearchBookSearchBar: View {
    @Binding var searchText: String
    var searchRouter: SearchRouter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderSection(title: "어떤 책을 읽고 있나요?",
                          subtitle: "책을 재료 삼아 빵을 구울 수 있습니다.")
            .padding(.bottom, 20)
            
            CustomSearchBar(searchText: $searchText,
                            searchRouter: searchRouter)
        }
    }
}

struct CustomSearchBar: View {
    @Binding var searchText: String
    var searchRouter: SearchRouter
    
    var body: some View {
        VStack {}
            .frame(maxWidth: .infinity, maxHeight: 46)
            .background(.typo10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.greenMain100)
                        .font(.system(size: 20, weight: .regular))
                        .kerning(-0.4)
                    
                    TextField("책을 검색해보세요", text: $searchText, onCommit: {
                        searchRouter.fetch(searchText: searchText)
                    })
                    .foregroundStyle(.typo80)
                    .font(.system(size: 15, weight: .regular))
                }
                .padding(.leading, 15)
                .padding(.trailing, 13)
            }
            .padding(.horizontal, 22)
        
    }
}

#Preview {
    SearchBookSearchBar(searchText: .constant(""), searchRouter: SearchRouter())
}
