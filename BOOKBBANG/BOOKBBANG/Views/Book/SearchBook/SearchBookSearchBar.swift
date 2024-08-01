//
//  SearchBookSearchBar.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/31/24.
//

import SwiftUI

struct SearchBookSearchBar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("빵을 골라볼까요?")
                .foregroundStyle(.typo100)
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 10)
            
            Text("책빵에선 책을 재료 삼아 빵으로 구울 수 있습니다.")
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 20)
            
            CustomSearchBar()
            
        }
    }
}

struct CustomSearchBar: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {}
            .frame(maxWidth: .infinity, maxHeight: 46)
            .background(.typo10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                HStack {
                    TextField("책을 검색해보세요", text: $searchText)
                        .foregroundStyle(.typo80)
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.greenMain100)
                        .font(.system(size: 20, weight: .regular))
                        .kerning(-0.4)
                }
                .padding(.leading, 15)
                .padding(.trailing, 13)
            }
            
    }
}

#Preview {
    SearchBookSearchBar()
}
