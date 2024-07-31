//
//  AddDough.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddDough: View {
    var body: some View {
      VStack {
        Text("구워질 빵 반죽을 선택해주세요")
          .font(.system(size: 24))
          .padding(.top, 70)
          .padding(.bottom, 5)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
        
        Text("선택한 반죽 모양에 따라 다른 빵이 탄생해요")
          .font(.system(size: 12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
        
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.red)
          .frame(width: 120, height: 120)
          .padding(.top, 50)
        
        Text("빵 반죽")
          .font(.system(size: 12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 22)
          .padding(.top, 80)
        
        VStack(spacing: 12) {
          HStack(spacing: 12) {
            ForEach(0..<4) { index in
              Button(action: {
              }) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color.red)
                  .frame(width: 80, height: 80)
              }
            }
          }
          
          HStack(spacing: 12) {
            ForEach(4..<8) { index in
              Button(action: {
              }) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(Color.red)
                  .frame(width: 80, height: 80)
              }
            }
          }
        }
        .padding(.top, 5)
      }
      Spacer()
    }
}
   

#Preview {
  AddDough()
}
