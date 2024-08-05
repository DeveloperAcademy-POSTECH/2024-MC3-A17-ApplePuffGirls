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
    Text("클립 디자인")
      .font(.bookCaption)
      .foregroundStyle(.typo50)
      .padding(.trailing, 300)
      .padding(.top, 15)
    
    VStack(spacing: 12) {
      ForEach(0..<2) { row in
        HStack(spacing: 12) {
          ForEach(0..<4) { column in
            let index = row * 4 + column
            if index < ClipShapeImage.allCases.count {
              let shape = ClipShapeImage.allCases[index]
              Button(action: {
                clipData.selectedShape = index
              }) {
                RoundedRectangle(cornerRadius: 10)
                  .strokeBorder(clipData.selectedShape == index ? Color.green : Color.gray.opacity(0.5), lineWidth: clipData.selectedShape == index ? 2 : 1)
                  .background(
                    Image(shape.imageName)
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

#Preview {
  ClipShapeButton()
}
