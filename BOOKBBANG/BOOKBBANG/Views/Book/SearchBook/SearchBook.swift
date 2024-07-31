//
//  SearchBook.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI
import UIKit

struct SearchBook: View {
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBookHeader()
            
            SearchBookProgressBar()
                .padding(.bottom, 77)
            
            
            SearchBookSearchBar()
                .padding(.horizontal, 22)
                .padding(.bottom, 30)
            
            ScrollView {
                Spacer().frame(height: 20)
                
                ForEach(0..<5) { _ in
                    SearchBookListRow(isSelected: $isSelected)
                        .padding(.bottom, 25)
                        .padding(.leading, 20)
                    
                    VStack{}
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .frame(height: 0.5)
                        .background(.divider)
                        .padding(.bottom, 25)
                        .padding(.horizontal, 14)
                }
            }
            
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
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
