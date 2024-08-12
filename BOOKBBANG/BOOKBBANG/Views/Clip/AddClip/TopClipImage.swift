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
        Image(ClipItem.allCases[clipData.selectedShape].clipImageName)
            .renderingMode(.template)
            .resizable()
            .frame(width: 115, height: 110)
            .padding(.vertical, 50)
            .foregroundColor( Colors.allCases[clipData.selectedColor].color)
    }
}

#Preview {
    TopClipImage()
}
