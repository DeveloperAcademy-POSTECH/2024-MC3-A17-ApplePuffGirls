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
        NavigationStack {
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
                    
                    HStack {
                        Text("혹시 원하는 책이 없나요?")
                            .foregroundStyle(.typo50)
                            .font(.system(size: 13, weight: .regular))
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            fetchImage(url: "https://i.pinimg.com/564x/88/cd/0b/88cd0beb38989c7f9418f0f06449fc32.jpg")
                        }, label: {
                            DirectRegisterBookButton()
                        })
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 40)
                }
                
                .scrollIndicators(.hidden)
            }
            .background(.backLighter)
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

func DirectRegisterBookButton() -> some View {
    return RoundedRectangle(cornerRadius: 29)
        .stroke(.greenMain100, lineWidth: 1.0)
        .frame(width: 120 ,height: 32)
        .overlay {
            Text("+  직접 추가하기")
                .foregroundStyle(.greenMain100)
                .font(.system(size: 13, weight: .regular))
                .padding(.horizontal, 10)
        }
}

#Preview {
    SearchBook()
}
