//
//  AddBookFinal.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/1/24.
//

import SwiftUI

struct AddBookFinal: View {
  var body: some View {
    
    VStack{
      HeaderSection(title: "책 추가를 완료했습니다",
                    subtitle: "맛있는 빵을 만들러 가볼까요?")
      .padding(.top, 150)
      .padding(.bottom, 50)
      
      Image(.shakeDough)
     
    }
    Spacer()
  }
}

#Preview {
  AddBookFinal()
}
