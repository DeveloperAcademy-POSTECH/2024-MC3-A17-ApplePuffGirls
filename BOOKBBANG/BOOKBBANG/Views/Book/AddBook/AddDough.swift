//
//  AddDough.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/31/24.
//

import SwiftUI

struct AddDough: View {
  @State var selectedDough: DoughImage? = .croissant
  
  
  var body: some View {
    VStack {
      HeaderSection(title: "구워질 빵 반죽을 선택해주세요", subtitle: "선택한 반죽 모양에 따라 다른 빵이 탄생해요")
      
      
      Image(selectedDough?.imageName ?? DoughImage.croissant.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 170, height: 170)
        .padding(.vertical, 40)
      
      
      Text("빵 반죽")
        .font(.bookCaption)
        .foregroundStyle(.typo50)
        .padding(.trailing, 300)
        .padding(.top, 15)
      
      
      VStack(spacing: 12) {
        ForEach(0..<(DoughImage.allDoughCount/4) + 1, id: \.self) { rowIndex in
          HStack(spacing: 12) {
            ForEach(0..<4) { columnIndex in
              let index = rowIndex * 4 + columnIndex
              if index < DoughImage.allCases.count {
                let dough = DoughImage.allCases[index]
                Button(action: {
                  selectedDough = dough
                }) {
                  RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(selectedDough == dough ? Color.green : Color.gray, lineWidth: selectedDough == dough ? 2 : 1)
                    .background(
                      Image(dough.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(12)
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
    }
  }
}


#Preview {
  AddDough()
}

