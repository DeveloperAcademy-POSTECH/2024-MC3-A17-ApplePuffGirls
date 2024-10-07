//
//  Onboarding.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 9/29/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Image(.mustache)
                    .padding(.bottom, 20)
                
                Text("책 반죽하기")
                    .fontWeight(.bold)
                    .foregroundStyle(.greenMain100)
                    .padding(.bottom, 20)
                    .kerning(-0.4)
                
                Text("빵을 만들려면 재료가 필요하죠\n어떤 책을 재료로 반죽을 만들어볼까요?\n그리고 이 책은 어떤 맛이 나는지 들려주세요")
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.typo80)
                    .kerning(-0.4)
            }
        }
    }
}

#Preview {
    Onboarding()
}
