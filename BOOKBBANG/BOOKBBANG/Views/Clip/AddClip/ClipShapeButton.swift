//
//  ClipShapeButton.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/4/24.
//

import SwiftUI

struct ClipShapeButton: View {
  @ObservedObject var clipData = ClipData()
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("디자인")
        .font(.bookCaption)
        .foregroundStyle(.typo50)
        .padding(.trailing, 300)
        .padding(.top, 15)
      
      VStack(spacing: 12) {
        ForEach(0..<2) { row in
          HStack(spacing: 12) {
            ForEach(0..<4) { column in
              let index = row * 4 + column
              if index < ClipItem.allCases.count {
                let shape = ClipItem.allCases[index]
                Button(action: {
                  clipData.selectedShape = index
                }) {
                  RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(clipData.selectedShape == index ? Color.green : Color.gray.opacity(0.5), lineWidth: clipData.selectedShape == index ? 2 : 1)
                    .background(
                      Image(shape.shapeImageName)  // 수정된 부분
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
  }
}
