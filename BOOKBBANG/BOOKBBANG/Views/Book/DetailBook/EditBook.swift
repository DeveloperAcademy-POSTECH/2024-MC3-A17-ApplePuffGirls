//
//  EditBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/6/24.
//

import SwiftUI

struct EditBook: View {
  @Binding var isPresented: Bool
  @State var selectedGenre: BookGenre?
  @State var selectedReadStatus: ReadStatus?
  @State var selectedDate: Date = Date()
  
  var body: some View {
    ZStack {
      Color.backLighter
        .edgesIgnoringSafeArea(.all)
      VStack {
        CustomNavigationBar(isHighlighted: .constant(true),
                            navigationType: .cancel,
                            title: "책 수정하기",
                            rightTitle: "완료")
        
        BookInfoSection(selectedGenre: $selectedGenre,
                        selectedReadStatus: $selectedReadStatus,
                        selectedDate: $selectedDate)
        
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
        Spacer()
      }
    }
  }
}

#Preview {
  EditBook(isPresented: .constant(true))
}
