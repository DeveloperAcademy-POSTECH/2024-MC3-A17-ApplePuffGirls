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
      HeaderSection(title: "빵 굽기를 완료했습니다", 
                    subtitle: "맛있는 빵을 만들었어요. 축하합니달라.")
      
      // 오븐 이미지 아님, 다다가 그릴 예정
      Image(.oven)
        .padding(.top, 50)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
  }
}

#Preview {
  AddBookFinal()
}
