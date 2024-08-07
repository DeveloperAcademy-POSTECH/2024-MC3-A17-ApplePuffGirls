//
//  ClipTextFields.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/5/24.
//

import SwiftUI

struct ClipTextFields: View {
  @ObservedObject var clipData: ClipData
  
  let nameLimit = 13
  let descriptionLimit = 25
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("기본 정보")
        .font(.bookCaption)
        .foregroundStyle(.typo50)
        .padding(.trailing, 300)
      
      Group {
        TextField("클립 제목을 입력해주세요", text: $clipData.name)
          .onChange(of: clipData.name) { newValue in
            if newValue.count > nameLimit {
              clipData.name = String(newValue.prefix(nameLimit))
            }
          }
        
        TextField("클립에 대한 설명을 입력해주세요", text: $clipData.description)
          .onChange(of: clipData.description) { newValue in
            if newValue.count > descriptionLimit {
              clipData.description = String(newValue.prefix(descriptionLimit))
            }
          }
      }
      .frame(width: 330, height: 18)
      .padding()
      .background(Color.typo10)
      .cornerRadius(10)
    }
  }
}

#Preview {
  ClipTextFields(clipData: ClipData())
}