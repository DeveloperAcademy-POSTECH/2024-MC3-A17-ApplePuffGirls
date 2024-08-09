//
//  BookInfoSection.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/2/24.
//

import SwiftUI

struct BookInfoSection: View {
    @Binding var selectedGenre: BookGenre?
    @Binding var selectedReadStatus: ReadStatus?
    @Binding var selectedDate: Date
    
    var book: BookData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.backDarker)
            .frame(width: 380, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.typo25, lineWidth: 1)
                    .overlay {
                        HStack {
                            fetchHomeImage(url: book.thumbnail)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(book.title)
                                    .font(.bookTitle)
                                    .foregroundColor(.typo100)
                                    .kerning(-1)
                                    .padding(.bottom, 3)
                                
                                Text(book.authors)
                                    .font(.bookCaption)
                                    .foregroundStyle(.typo80)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 20)
                                
                                ForEach(["장르", "독서 상태", "독서 날짜"], id: \.self) { text in
                                    HStack(spacing: 0) {
                                        Text(text)
                                            .font(.bookCaption)
                                            .foregroundStyle(.typo50)
                                            .padding(.trailing, 5)
                                        
                                        if text == "독서 날짜" {
                                            Text("\(selectedDate, formatter: dateFormatter)")
                                                .font(.bookCaptionBold)
                                                .foregroundStyle(.typo100)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                        } else if text == "장르" {
                                            Text(selectedGenre?.description ?? "미설정")
                                                .font(selectedGenre != nil ? .bookCaptionBold : .bookCaption)
                                                .foregroundStyle(.typo100)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.leading, 26)
                                            
                                        } else if text == "독서 상태" {
                                            Text(selectedReadStatus?.rawValue ?? "미설정")
                                                .font(selectedReadStatus != nil ? .bookCaptionBold : .bookCaption)
                                                .foregroundStyle(.typo100)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                    .padding(.bottom, 3)
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.vertical, 30)
                        .padding(.horizontal, 20)
                    }
            )
            .padding(.top, 20)
    }
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}
