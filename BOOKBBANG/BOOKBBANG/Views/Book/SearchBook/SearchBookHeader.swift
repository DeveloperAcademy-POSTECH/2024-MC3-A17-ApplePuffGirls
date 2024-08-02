//
//  SearchBookHeader.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/31/24.
//

import SwiftUI

struct SearchBookHeader: View {
    @Binding var bookSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundStyle(.greenMain100)
            
            Spacer()
            
            Text("책 검색")
                .foregroundStyle(.typo100)
                .font(.system(size: 18, weight: .semibold))
                .kerning(-0.4)
            
            Spacer()
            
            Text("다음")
                .foregroundStyle(bookSelected ? .greenMain100 : .typo25)
                .font(.system(size: 17, weight: .bold))
                .kerning(-0.4)
        }
        .padding(.horizontal, 23)
        .frame(height: 55)
        .background(.backLighter)
    }
}

#Preview {
    SearchBookHeader(bookSelected: .constant(true))
}
