//
//  SearchBook.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI
import UIKit

struct SearchBook: View {
    var body: some View {
        VStack(spacing: 0) {
            SearchBookHeader()
            SearchBookProgressBar()
                .padding(.bottom, 77)
            
            SearchBookSearchBar()
                .padding(.horizontal, 22)
            
            Spacer()
        }
    }
}

func SearchBookProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 3, height: 2)
                .background(.greenMain100)
        }
}

#Preview {
    SearchBook()
}
