//
//  AddBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel: HomeViewModel
    @State var selectedGenre: BookGenre?
    @State var selectedDate: Date = Date()

    @Binding var bookData: BookData
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 책 추가하기",
                                rightTitle: "다음",
                                onChevron: { homeViewModel.transition(to: .searchBook) },
                                onRightButton: { clickRightButton() })
            
            SearchBookProgressBar(process: 2)
                .padding(.bottom, 28)
            
            VStack(spacing: 0) {
                HeaderSection(title: "책에 대한 정보를 작성해주세요",
                              subtitle: "책을 맛있게 만들기 위해 정확한 계량 정보가 필요해요")
                .padding(.bottom, 20)
                
                BookInfoSection(selectedGenre: $selectedGenre,
                                selectedDate: $selectedDate,
                                book: bookData)
                
                BookGenreView(selectedGenre: $selectedGenre)
                
                VStack(alignment: .leading) {
                    Text("등록 날짜")
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
    private func saveBookDetails() {
        bookData.genre = selectedGenre?.description
        bookData.readDate = selectedDate
        homeViewModel.selectBookData(bookData)
    }
    
    private func clickRightButton() {
        saveBookDetails()

        homeViewModel.selectBookData(bookData)
        
        let newBook = Book(context: viewContext)
        newBook.name = homeViewModel.selectedBookData?.title
        newBook.author = homeViewModel.selectedBookData?.authors
        newBook.thumbnail = homeViewModel.selectedBookData?.thumbnail
        
        newBook.publishedDate = homeViewModel.selectedBookData?.publishedDate
        newBook.publisher = homeViewModel.selectedBookData?.publisher
        
        newBook.genre = homeViewModel.selectedBookData?.genre
        newBook.readDate = homeViewModel.selectedBookData?.readDate
        newBook.registerDate = homeViewModel.selectedBookData?.registerDate
        
        //뷰 확인을 위한 임시 코드 추가
        homeViewModel.selectBook(newBook)
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        
        homeViewModel.transition(to: .addBookFinal)
    }
}
