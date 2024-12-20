//
//  EditBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/6/24.
//

import SwiftUI

struct EditBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var book: Book
    @ObservedObject var bookData: BookData = BookData()

    @EnvironmentObject var homeViewModel: HomeViewModel
    
    init(book: Book) {
        self.book = book
        bookData.thumbnail = book.thumbnail ?? ""
        bookData.title = book.name ?? ""
        bookData.authors = book.author ?? ""
        
        bookData.genre = book.genre ?? ""
        bookData.readDate = book.readDate ?? .now
    }
    
    var body: some View {
        ZStack {
            Color.backLighter
                .edgesIgnoringSafeArea(.all)
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .cancel,
                                    title: "책 수정하기",
                                    rightTitle: "완료",
                                    onCancel: { dismiss() },
                                    onRightButton: { clickRightButton() })
                
                EditBookInfoSection(book: bookData)
                
                EditBookGenreSection(book: bookData)

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
                                selection: $bookData.readDate,
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
    
    private func clickRightButton() {
        book.genre = bookData.genre
        book.readDate = bookData.readDate
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        dismiss()
    }
}
