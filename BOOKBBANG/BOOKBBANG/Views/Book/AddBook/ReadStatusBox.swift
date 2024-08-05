//
//  ReadStatusBox.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/3/24.
//

import SwiftUI

struct ReadStatusBox: View {
  @Binding var selectedReadStatus: ReadStatus?
  
  var body: some View {
    VStack {
      Text("현재 독서 상태")
        .font(.bookCaption)
        .foregroundStyle(.typo50)
        .padding(.trailing, 260)
        .padding(.top, 15)
      
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.typo50)
          .opacity(0.1)
          .frame(width: 355, height: 45)
        
        HStack(spacing: 10) {
          ForEach(ReadStatus.allCases, id: \.self) { readstatus in
            Button(action: {
              selectedReadStatus = readstatus
            }) {
              Text(readstatus.description)
                .font(.addBookButton)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                  RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(selectedReadStatus == readstatus ? .greenMain100 : .clear)
                    .overlay(
                      RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedReadStatus == readstatus ? Color.greenMain100 : Color.typo50, lineWidth: 1)
                    )
                )
                .foregroundColor(selectedReadStatus == readstatus ? .white : .typo50)
            }
          }
          Spacer()
        }
        .padding(.leading, 45)
      }
    }
  }
}

#Preview {
  ReadStatusBox(selectedReadStatus: .constant(nil))
}

