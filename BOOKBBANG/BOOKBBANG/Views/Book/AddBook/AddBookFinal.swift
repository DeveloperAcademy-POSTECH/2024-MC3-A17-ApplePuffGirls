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
      HeaderSection(title: "빵 굽기를 완료했습니다", subtitle: "축하합니다링. 문구 같이 고민 좀 해주세요.")
      
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
