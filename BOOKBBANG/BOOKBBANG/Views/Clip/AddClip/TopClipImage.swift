//
//  TopClipImage.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/4/24.
//

import SwiftUI

struct TopClipImage: View {
    @ObservedObject var clipData = ClipData()
    
    var body: some View {
        Image(clipData.selectedShape != nil ? ClipItem.allCases[clipData.selectedShape!].clipImageName : ClipItem.WaterDrop.clipImageName)
            .renderingMode(.template)
            .resizable()
            .frame(width: 115, height: 110)
            .padding(.vertical, 50)
            .foregroundColor(clipData.selectedColor != nil ? Colors.allCases[clipData.selectedColor!].color : Colors.cred.color)
    }
}

#Preview {
    TopClipImage()
}
