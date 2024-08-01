//
//  SearchBookListRow.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import SwiftUI

struct SearchBookListRow: View {
    @Binding var isSelected: Bool
    var book: Documents
    
    var body: some View {
        HStack {
            fetchImage(url: book.thumbnail)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(width: 12)
            
            VStack(alignment: .leading ,spacing: 0) {
                Text(book.title)
                    .foregroundStyle(.typo100)
                    .font(.system(size: 17, weight: .bold))
                    .kerning(-1)
                
                HStack {
                    ForEach(book.authors, id: \.self) { author in
                        Text(author)
                            .foregroundStyle(.typo50)
                            .font(.system(size: 13, weight: .regular))
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("출판사")
                        .foregroundStyle(.typo30)
                        .font(.system(size: 13, weight: .regular))
                        .kerning(-0.4)
                    
                    Text(book.publisher)
                        .foregroundStyle(.typo80)
                        .font(.system(size: 13, weight: .regular))
                }
                
                HStack {
                    Text("발행일")
                        .foregroundStyle(.typo30)
                        .font(.system(size: 13, weight: .regular))
                        .kerning(-0.4)
                    
                    Text(formatISO8601Date(dateStr: book.datetime))
                        .foregroundStyle(.typo80)
                        .font(.system(size: 13, weight: .regular))
                }
            }
            .padding(.vertical, 15)
            
            Spacer()
 
            if isSelected {
                SelectedCircle()
                    .onTapGesture {
                        isSelected.toggle()
                    }
            }
            else {
                Circle()
                    .stroke(.typo25, lineWidth: 1.0)
                    .frame(width: 23)
                    .onTapGesture {
                        isSelected.toggle()
                    }
            }
            
            Spacer().frame(width: 23)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 140)
    }
}

struct SelectedCircle: View {
    var body: some View {
        Circle()
            .stroke(.greenMain100, lineWidth: 2.0)
            .frame(width: 23)
            .overlay {
                Circle()
                    .fill(.greenMain100)
                    .frame(width: 11)
            }
    }
}

func formatISO8601Date(dateStr: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    guard let date = isoFormatter.date(from: dateStr) else {
        return "Invalid date"
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd."
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter.string(from: date)
}
