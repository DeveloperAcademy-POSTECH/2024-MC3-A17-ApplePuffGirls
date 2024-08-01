//
//  AddBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddBook: View {
  @State private var progress: Double = 0.34
  @State private var selectedGenre: String? = nil
  @State private var selectedCondition: String? = nil
  @State private var selectedDate: Date = Date()
  @State private var showingAddDough = false
  @State private var navigateToFinal = false
  
  let bookGenre = [
    "시/에세이", "소설", "인문", "경제/경영", "종교", "사회/정치", "자기계발", "역사",
    "자연/과학", "기타"
  ]
  
  let situation = [
    "읽기 전", "읽는 중", "읽기 완료"
  ]
  
  var isNextButtonDisabled: Bool {
    selectedGenre == nil || selectedCondition == nil
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        AddBookTitle(progress: $progress, showingAddDough: $showingAddDough)
        
        VStack {
          if showingAddDough {
            AddDough()
          } else {
            bookInfoForm
          }
        }
      }
      .navigationBarTitle("책 정보 입력", displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: {
          showingAddDough = false
        }) {
          Image(systemName: "chevron.backward")
            .foregroundColor(.greenMain100)
            .padding(.leading, 10)
        },
        trailing: Button(action: {
          if progress < 1.0 {
            progress += 0.33
          }
          showingAddDough = true
        }) {
          Text("다음")
            .foregroundColor(isNextButtonDisabled ? .typo50 : .greenMain100)
            .padding(.trailing, 10)
            .padding(.trailing, 10)
        }
          .disabled(isNextButtonDisabled)
      )
    }
  }
  
  var bookInfoForm: some View {
    VStack {
      Text("빵에 대한 정보를 적어주세요")
        .font(.system(size: 24, weight: .bold))
        .foregroundStyle(.typo100)
        .padding(.bottom, 5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
      Text("책을 맛있게 만들기 위해 정확한 계량을 위한 정보가 필요해요")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
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
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.leading, 25)
          
          VStack{
            Text("로셸로쉘몽쉘")
              .font(.system(size: 24, weight: .bold))
              .foregroundStyle(.typo100)
              .padding(.bottom, 5)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 22)
            
            Text("로셸(지은이), 몽쉘(엮은이)")
              .font(.system(size: 12))
              .foregroundStyle(.typo100)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 22)
            
            ForEach(["장르", "독서 상태", "읽은 날짜"], id: \.self) { text in
              HStack {
                Text(text)
                  .font(.system(size: 12))
                  .foregroundStyle(.typo50)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.leading, 22)
                
                Text("미설정")
                  .font(.system(size: 12))
                  .foregroundStyle(.typo50)
                  .frame(maxWidth: .infinity, alignment: .leading)
              }
            }
          }
        }
        .padding(.top, 20)
      }
      
      Text("책 장르")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
        .padding(.top, 15)
      
      ZStack {
        VStack(spacing: 10) {
          ForEach(0..<bookGenre.count / 4 + 1, id: \.self) { rowIndex in
            HStack {
              ForEach(0..<4) { columnIndex in
                let index = rowIndex * 4 + columnIndex
                if index < bookGenre.count {
                  let genre = bookGenre[index]
                  Button(action: {
                    selectedGenre = genre
                  }) {
                    Text(genre)
                      .font(.system(size: 15))
                      .padding(.horizontal, 15)
                      .padding(.vertical, 5)
                      .background(
                        RoundedRectangle(cornerRadius: 20)
                          .foregroundColor(selectedGenre == genre ? .greenMain100 : .clear)
                          .overlay(
                            RoundedRectangle(cornerRadius: 20)
                              .stroke(selectedGenre == genre ? Color.greenMain100 : Color.typo50, lineWidth: 1)
                          )
                      )
                      .foregroundColor(selectedGenre == genre ? .white : .typo50)
                  }
                }
              }
              Spacer()
            }
          }
        }
        .padding(.leading, 42)
        
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.typo50)
          .opacity(0.1)
          .frame(width: 355, height: 140)
      }
      
      Text("현재 독서 상태")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
        .padding(.top, 15)
      
      ZStack {
        HStack {
          ForEach(situation, id: \.self) { condition in
            Button(action: {
              selectedCondition = condition
            }) {
              Text(condition)
                .font(.system(size: 15))
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                  RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(selectedCondition == condition ? .greenMain100 : .clear)
                    .overlay(
                      RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedCondition == condition ? Color.greenMain100 : Color.typo50, lineWidth: 1)
                    )
                )
                .foregroundColor(selectedCondition == condition ? .white : .typo50)
            }
          }
        }
        .padding(.trailing, 60)
        
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.typo50)
          .opacity(0.1)
          .frame(width: 355, height: 45)
      }
      
      Text("독서 날짜")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
        .padding(.top, 15)
      
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



#Preview {
  AddBook()
}
