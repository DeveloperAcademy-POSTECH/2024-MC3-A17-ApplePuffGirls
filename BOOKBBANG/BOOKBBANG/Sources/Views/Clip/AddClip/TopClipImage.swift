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
        Image(ClipItem.getClipShape(clipData.selectedShape))
            .renderingMode(.template)
            .resizable()
            .frame(width: 115, height: 110)
            .foregroundColor(
                Colors.getClipColor(clipData.selectedColor)
            )
            .overlay {
                Image(ClipItem.getClipBackgroundShape(clipData.selectedShape))
                    .resizable()
                    .frame(width: 115, height: 110)
            }
            .padding(.top, 30)
            .padding(.bottom, 20)
    }
}

#Preview {
    TopClipImage()
}
