//
//  DetailClipProfile.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import SwiftUI

struct DetailClipProfile: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.starClip)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding(.bottom, 14)
            
            Text("행복한 나의 빵 먹기 생활")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.typo100)
                .padding(.bottom, 5)
                .kerning(-0.7)
            
            Text("빵을 먹을 때의 꿀팁들과 맛있는 빵 먹는 묘사들")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.typo50)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    DetailClipProfile()
}
