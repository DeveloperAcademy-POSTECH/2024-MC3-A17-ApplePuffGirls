//
//  AddBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddBook: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var selectedGenre: BookGenre?
    @State var selectedReadStatus: ReadStatus?
    @State var selectedDate: Date = Date()
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 책 추가하기",
                                rightTitle: "다음",
                                onChevron: { homeViewModel.transition(to: .searchBook) },
                                onRightButton: { homeViewModel.transition(to: .addDough) })
            
            SearchBookProgressBar(process: 2)
                .padding(.bottom, 30)
            
            VStack(spacing: 0) {
                HeaderSection(title: "책에 대한 정보를 작성해주세요",
                              subtitle: "책을 맛있게 만들기 위해 정확한 계량 정보가 필요해요")
                .padding(.top, 20)
                
                BookInfoSection(selectedGenre: $selectedGenre,
                                selectedReadStatus: $selectedReadStatus,
                                selectedDate: $selectedDate, book: book)
                
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
            
            Spacer()
        }
        .background(.backLighter)
    }
}

//#Preview {
//    AddBook(homeViewModel: HomeViewModel())
//}
