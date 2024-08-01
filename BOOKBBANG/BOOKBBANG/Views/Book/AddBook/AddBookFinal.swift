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
      Text("빵 굽기를 완료했습니다")
        .font(.system(size: 24, weight:.bold))
        .foregroundStyle(.typo100)
        .padding(.bottom, 5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
      Text("축하합니다. 구워진 빵을 리스트에서 확인해볼까요?")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
      // 오븐 이미지 아님, 다다가 그릴 예정
      Image("oven")
        .padding(.top, 50)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
  }
}

#Preview {
    AddBookFinal()
}
