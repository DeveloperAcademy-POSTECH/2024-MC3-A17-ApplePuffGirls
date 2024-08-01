//
//  AddDough.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddDough: View {
  @State private var selectedDough: Int? = 0
  @State private var selectedShape: Int? = 0
  
  let DoughImages = [
    "Dough_1", "Dough_2", "Dough_3", "Dough_4",
    "Dough_5", "Dough_6", "Dough_7", "Dough_8"
  ]
  
  
  var body: some View {
    VStack {
      Text("구워질 빵 반죽을 선택해주세요")
        .font(.system(size: 24, weight:.bold))
        .foregroundStyle(.typo100)
        .padding(.bottom, 5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
      Text("선택한 반죽 모양에 따라 다른 빵이 탄생해요")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
      
      Image(selectedDough != nil ? DoughImages[selectedDough!] : "Dough_1")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
        .padding(.top, 30)
      
      
      Text("빵 반죽")
        .font(.system(size: 12))
        .foregroundStyle(.typo50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 22)
        .padding(.top, 40)
      
      
      VStack(spacing: 12) {
        HStack(spacing: 12) {
          ForEach(0..<4) { index in
            Button(action: {
              selectedDough = index
              selectedShape = index
            }) {
              RoundedRectangle(cornerRadius: 10)
                .strokeBorder(selectedDough == index ? Color.greenMain100 : Color.typo10, lineWidth: selectedDough == index ? 4 : 1)
                .background(
                  Image(DoughImages[index])
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                )
                .frame(width: 80, height: 80)
            }
          }
        }
        
        HStack(spacing: 12) {
          ForEach(4..<8) { index in
            Button(action: {
              selectedDough = index
              selectedShape = index
            }) {
              RoundedRectangle(cornerRadius: 10)
                .strokeBorder(selectedDough == index ? Color.greenMain100 : Color.typo10, lineWidth: selectedDough == index ? 4 : 1)
                .background(
                  Image(DoughImages[index])
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                )
                .frame(width: 80, height: 80)
            }
          }
        }
      }
    }
  }
}

#Preview {
  AddDough()
}

