//
//  ClipColorButton.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/4/24.
//

import SwiftUI


struct ClipColorButton: View {
  @ObservedObject var clipData: ClipData
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("색상")
        .font(.bookCaption)
        .foregroundStyle(.typo50)
        .padding(.trailing, 300)
        .padding(.top, 15)
      
      HStack(spacing: 14) {
        ForEach(Colors.allCases, id: \.self) { color in
          Button(action: {
              clipData.selectedColor = Colors.allCases.firstIndex(of: color) ?? 0
          }) {
            Rectangle()
              .fill(color.color)
              .frame(width: 33, height: 35)
              .cornerRadius(5)
              .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(clipData.selectedColor == Colors.allCases.firstIndex(of: color) ? Color.greenMain100 : Color.clear,
                            lineWidth: clipData.selectedColor == Colors.allCases.firstIndex(of: color) ? 2 : 0)
              )
          }
        }
      }
    }
  }
}

struct ClipColorButton_Previews: PreviewProvider {
  static var previews: some View {
    ClipColorButton(clipData: ClipData())
  }
}
