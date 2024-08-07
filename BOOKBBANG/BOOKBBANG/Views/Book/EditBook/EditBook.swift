//
//  EditBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/6/24.
//

import SwiftUI

struct EditBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isPresented: Bool
    @State var selectedGenre: BookGenre?
    @State var selectedReadStatus: ReadStatus?
    @State var selectedDate: Date = Date()
    
    @Binding var book: Book
    
    var body: some View {
        ZStack {
            Color.backLighter
                .edgesIgnoringSafeArea(.all)
            VStack {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .cancel,
                                    title: "책 수정하기",
                                    rightTitle: "완료",
                                    onCancel: { isPresented.toggle() },
                                    onRightButton: { clickRightButton() })
                
                EditBookInfoSection(selectedGenre: $selectedGenre,
                                    selectedReadStatus: $selectedReadStatus,
                                    selectedDate: $selectedDate,
                                    book: book)
                
                EditBookGenreSection(selectedGenre: $selectedGenre,
                                     book: book)
                
                EditReadStatusSection(selectedReadStatus: $selectedReadStatus,
                                      book: book)
                
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
    
    private func clickRightButton() {
        book.genre = selectedGenre?.description
        book.readStatus = selectedReadStatus?.rawValue
        book.readDate = selectedDate
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        isPresented.toggle()
    }
}
