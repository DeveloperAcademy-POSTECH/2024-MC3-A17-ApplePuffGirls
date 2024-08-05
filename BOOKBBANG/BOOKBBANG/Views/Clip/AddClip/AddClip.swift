//
//  AddClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddClip: View {
  @ObservedObject var clipData = ClipData(selectedShape: 0, selectedColor: 0)
  
  let nameLimit = 13
  let descriptionLimit = 25
  
  var body: some View {
    TopClipImage(clipData: clipData)
    
    VStack(alignment: .leading) {
      ClipTextFields(clipData: clipData)
      
      ClipShapeButton(clipData: clipData)
        .padding(.vertical, 5)
      
      ClipColorButton(clipData: clipData)
      
      Spacer()
    }
  }
}



#Preview {
  AddClip()
}
