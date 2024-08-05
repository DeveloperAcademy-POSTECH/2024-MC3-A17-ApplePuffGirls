//
//  AddBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddBook: View {
  @State var selectedGenre: BookGenre?
  @State var selectedReadStatus: ReadStatus?
  @State var selectedDate: Date = Date()
  
  var body: some View {
    VStack {
      HeaderSection(title: "빵에 대한 정보를 적어주세요", 
                    subtitle: "책을 맛있게 만들기 위해 정확한 계량을 위한 정보가 필요해요")
      
      BookInfoSection(selectedGenre: .constant(nil), 
                      selectedReadStatus: .constant(nil),
                      selectedDate: .constant(Date()))
      
      BookGenreView(selectedGenre: $selectedGenre)
      
      ReadStatusBox(selectedReadStatus: $selectedReadStatus)
      
      VStack(alignment: .leading) {
        Text("독서 날짜")
          .font(.bookCaption)
          .foregroundStyle(.typo50)
          .padding(.top, 15)
          .padding(.leading, 30)
        
        ZStack{
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.typo50)
            .opacity(0.1)
            .frame(width: 355, height: 45)
          HStack {
            DatePicker(
              "",
              selection: $selectedDate,
              displayedComponents: .date
            )
            .datePickerStyle(CompactDatePickerStyle())
            .frame(width: 100, alignment: .leading)
            .padding(.leading, 30)
            Spacer()
          }
        }
      }
    }
  }
}

#Preview {
  AddBook()
}
