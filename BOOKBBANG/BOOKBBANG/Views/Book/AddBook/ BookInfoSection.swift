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
  
  var body: some View {
    ZStack{
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.backLighter)
        .frame(width: 380, height: 180)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.typo25, lineWidth: 1)
        )
        .padding(.top, 20)
      HStack{
        Image("fish_2")
          .resizable()
          .frame(width: 86, height: 140)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .padding(.leading, 35)
        
        VStack(alignment: .leading){
          Text("로셸로쉘몽쉘")
            .font(.bookTitle)
            .foregroundColor(.typo100)
          
          Text("로셸(지은이), 몽쉘(엮은이)")
            .font(.bookCaption)
            .foregroundStyle(.typo80)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
          
          ForEach(["장르", "독서 상태", "읽은 날짜"], id: \.self) { text in
            HStack {
              Text(text)
                .font(.bookCaption)
                .foregroundStyle(.typo50)
              
              Text(selectedGenre?.rawValue ?? "미설정")
                .font(.system(size: 12))
                .foregroundStyle(.typo50)
                .frame(maxWidth: .infinity, alignment: .leading)
              
              
            }
          }
        }
        .padding(.leading, 15)
      }
      .padding(.top, 20)
    }
  }
}

#Preview {
  BookInfoSection(selectedGenre: .constant(nil), selectedReadStatus: .constant(nil), selectedDate: .constant(Date()))
}

