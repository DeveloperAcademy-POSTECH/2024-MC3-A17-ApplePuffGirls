//
//  DetailClipProfile.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import SwiftUI

struct DetailClipProfile: View {
    @ObservedObject var clip: Clip
    
    var body: some View {
        VStack(spacing: 0) {
            // 클립 이미지
            Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                .frame(height: 100)
                .padding(.bottom, 14)
            
            Text(clip.title ?? "")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.typo100)
                .padding(.bottom, 5)
                .kerning(-0.7)
            
            Text(clip.clipDescription ?? "")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.typo50)
                .padding(.bottom, 40)
        }
    }
}

//#Preview {
//    DetailClipProfile()
//}
