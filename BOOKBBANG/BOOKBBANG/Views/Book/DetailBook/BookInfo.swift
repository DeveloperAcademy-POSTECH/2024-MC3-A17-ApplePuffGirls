//
//  BookInfo.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct BookInfo: View {
   var book: Book

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 39) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(book.name ?? "알 수 없음")
                        .font(.bookTitle)
                        .kerning(-1)
                        .foregroundStyle(.typo100)
                    
                    Text(book.author ?? "작자미상")
                        .font(.bookCaption)
                        .foregroundStyle(.typo80)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        HStack {
                            Text("장르")
                                .font(.bookCaption)
                                .foregroundStyle(.typo50)
                            Spacer()
                        }
                        .frame(width: 67)
                        Text(book.genre ?? "")
                            .font(.bookCaptionBold)
                            .foregroundStyle(.typo80)
                    }
                    HStack {
                        HStack {
                            Text("읽은 날짜")
                                .font(.bookCaption)
                                .foregroundStyle(.typo50)
                            Spacer()
                        }
                        .frame(width: 67)
                        if let readDate = book.readDate {
                            Text("\(readDate, formatter: dateFormatter)")
                                .font(.bookCaptionBold)
                                .foregroundStyle(.typo80)
                        }
                        
                        if let readStatus = book.readStatus {
                            Text(readStatus)
                                .font(.readStateButton)
                                .frame(width: 43, height: 19)
                                .padding(.horizontal, 2)
                                .background(Capsule().stroke())
                                .foregroundStyle(.greenMain100)
                        }
                    }
                }
            }
            Spacer()
            
            fetchHomeImage(url: book.thumbnail ?? "")
        }
        .padding(.horizontal, 26)
        .padding(.vertical, 25)
    }
}

//#Preview {
//    BookInfo()
//}
