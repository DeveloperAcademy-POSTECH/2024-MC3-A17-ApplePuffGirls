//
//  EditReadStatusSection.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/8/24.
//

import SwiftUI

struct EditReadStatusSection: View {
    //@Binding var selectedReadStatus: ReadStatus?
    @ObservedObject var book: BookData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("독서 상태")
                .font(.bookCaption)
                .foregroundStyle(.typo50)
                .padding(.leading, 30)
                .padding(.top, 15)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.typo50)
                    .opacity(0.1)
                    .frame(width: 355, height: 45)
                
                HStack(spacing: 10) {
                    ForEach(ReadStatus.allCases, id: \.self) { readstatus in
                        Button(action: {
                            book.readStatus = readstatus.rawValue
                        }) {
                            Text(readstatus.rawValue)
                                .font(.addBookButton)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(book.readStatus == readstatus.rawValue ? .greenMain100 : .clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(book.readStatus == readstatus.rawValue ? Color.greenMain100 : Color.typo50, lineWidth: 1)
                                        )
                                )
                                .foregroundColor(book.readStatus == readstatus.rawValue ? .white : .typo50)
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 45)
            }
        }
    }
}
