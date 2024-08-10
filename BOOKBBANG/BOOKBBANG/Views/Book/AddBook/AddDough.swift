//
//  AddDough.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddDough: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel: HomeViewModel
    
    @State var selectedDough: Int = 0
    //@Binding var book: Book
    @Binding var bookData: BookData
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 책 추가하기",
                                rightTitle: "다음",
                                onChevron: { homeViewModel.transition(to: .addBook) },
                                onRightButton: { clickRightButton() })
            
            SearchBookProgressBar(process: 3)
                .padding(.bottom, 30)
            
            HeaderSection(title: "빵 반죽을 선택해주세요",
                          subtitle: "선택한 반죽에 따라 고유한 문구들이 담긴 빵이 구워져요")
            .padding(.top, 20)
            
            
            Image(DoughImage.allCases[selectedDough].rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .padding(.vertical, 40)
            
            
            Text("빵 반죽")
                .font(.bookCaption)
                .foregroundStyle(.typo50)
                .padding(.trailing, 300)
                .padding(.vertical, 15)
            
            VStack(spacing: 12) {
                ForEach(0..<(DoughImage.allDoughCount / 4) + 1, id: \.self) { rowIndex in
                    HStack(spacing: 12) {
                        ForEach(0..<4) { columnIndex in
                            let index = rowIndex * 4 + columnIndex
                            if index < DoughImage.allCases.count {
                                Button(action: {
                                    selectedDough = index
                                }) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(selectedDough == index ? Color.green : Color.gray, lineWidth: selectedDough == index ? 2 : 1)
                                        .background(
                                            Image(DoughImage.allCases[index].imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .padding(7)
                                        )
                                        .frame(width: 80, height: 80)
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            .padding(.leading, 20)
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        bookData.bread = selectedDough
        homeViewModel.selectBookData(bookData)
        
        let newBook = Book(context: viewContext)
        newBook.name = homeViewModel.selectedBookData?.title
        newBook.author = homeViewModel.selectedBookData?.authors
        newBook.thumbnail = homeViewModel.selectedBookData?.thumbnail
        
        newBook.publishedDate = homeViewModel.selectedBookData?.publishedDate
        newBook.publisher = homeViewModel.selectedBookData?.publisher
        
        newBook.genre = homeViewModel.selectedBookData?.genre
        newBook.readStatus = homeViewModel.selectedBookData?.readStatus
        newBook.readDate = homeViewModel.selectedBookData?.readDate
        newBook.registerDate = homeViewModel.selectedBookData?.registerDate
        
        newBook.bread = Int16(homeViewModel.selectedBookData?.bread ?? 0)
        
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
