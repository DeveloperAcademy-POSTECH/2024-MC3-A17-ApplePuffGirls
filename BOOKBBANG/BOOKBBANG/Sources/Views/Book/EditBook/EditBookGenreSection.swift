//
//  EditBookGenreSection.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/8/24.
//

import SwiftUI

struct EditBookGenreSection: View {
    @ObservedObject var book: BookData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("장르")
                .font(.bookCaption)
                .foregroundColor(.typo50)
                .padding(.leading, 30)
                .padding(.top, 15)
            
            ZStack {
                VStack(spacing: 10) {
                    ForEach(0..<(BookGenre.allGenreCount / 4) + 1, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<4) { columnIndex in
                                let index = rowIndex * 4 + columnIndex
                                if index < BookGenre.allGenreCount {
                                    let genre = BookGenre.allCases[index]
                                    Button(action: {
                                        book.genre = genre.description
                                    }) {
                                        Text(genre.description)
                                            .font(.addBookButton)
                                            .padding(.horizontal, 15)
                                            .padding(.vertical, 5)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundColor(book.genre == genre.description ? .greenMain100 : .clear)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(book.genre == genre.description ? Color.greenMain100 : Color.typo50, lineWidth: 1)
                                                    )
                                            )
                                            .foregroundColor(book.genre == genre.description ? .white : .typo50)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.leading, 45)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.typo50)
                    .opacity(0.1)
                    .frame(width: 355, height: 140)
            }
        }
        
    }
}
