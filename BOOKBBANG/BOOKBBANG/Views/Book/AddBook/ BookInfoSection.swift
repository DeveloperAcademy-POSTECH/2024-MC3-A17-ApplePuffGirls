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
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.backLighter)
        .frame(width: 380, height: 180)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.typo25, lineWidth: 1)
        )
        .padding(.top, 20)
      
      HStack {
        Image("fish_2")
          .resizable()
          .frame(width: 86, height: 140)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .padding(.leading, 35)
        
        VStack(alignment: .leading) {
          Text("로셸로쉘몽쉘")
            .font(.bookTitle)
            .foregroundColor(.typo100)
          
          Text("로셸(지은이), 몽쉘(엮은이)")
            .font(.bookCaption)
            .foregroundStyle(.typo80)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 30)
          
          displaytext(title: "장르", value: selectedGenre?.description, defaultValue: "미설정", paddingLeading: 26)
          
          displaytext(title: "독서 상태", value: selectedReadStatus?.description, defaultValue: "미설정")
          
          let dateText = dateFormatter.string(from: selectedDate)
          displaytext(title: "독서 날짜", value: dateText, defaultValue: "", paddingLeading: 0, isBold: true)
        }
        .padding(.leading, 15)
      }
      .padding(.top, 20)
    }
  }
  
  func displaytext(title: String, value: String?, defaultValue: String, paddingLeading: CGFloat = 0, isBold: Bool = false) -> some View {
    let displayText = value ?? defaultValue
    return HStack {
      Text(title)
        .font(.bookCaption)
        .foregroundStyle(.typo50)
      Text(displayText)
        .font(displayText == defaultValue ? .bookCaption : .bookCaptionBold)
        .foregroundStyle(.typo100)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, paddingLeading)
    }
  }
}

var dateFormatter: DateFormatter {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy.MM.dd"
  return formatter
}

#Preview {
  BookInfoSection(selectedGenre: .constant(nil), selectedReadStatus: .constant(nil), selectedDate: .constant(Date()))
}
