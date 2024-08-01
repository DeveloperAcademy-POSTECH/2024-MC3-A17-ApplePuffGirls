//
//  BookInfo.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct BookInfo: View {
    var author: String = "히가시노 게이고(지은이), 최고은(옮긴이)"
    var genre: String = "소설"
    var name: String = "당신이 누군가를 죽였다"
    var phraseCount: Int = 100
    var publisher: String = "제리"
    var readDate: Date = Date()
    var formattedDate: String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: readDate)
        
        if let year = components.year, let month = components.month, let day = components.day {
            return "\(year). \(month). \(day)"
        } else {
            return ""
        }
    }
    
    var readStatus: ReadStatus = .readIng
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 39) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(name)")
                        .font(.bookTitle)
                        .foregroundStyle(.typo100)
                    
                    Text("\(author)")
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
                        Text(genre)
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
                        Text("\(formattedDate)")
                            .font(.bookCaptionBold)
                            .foregroundStyle(.typo80)
                        
                        Text("\(readStatus.description)")
                            .font(.readStateButton)
                            .frame(width: 43, height: 19)
                            .background(Capsule().stroke())
                            .foregroundStyle(.greenMain100)
                    }
                }
            }
            Spacer()
            
            Image("fish_1")
                .resizable()
                .scaledToFit()
                .frame(width: 92)
        }
        .padding(.horizontal, 26)
        .padding(.vertical, 25)
    }
}

#Preview {
    BookInfo()
}
