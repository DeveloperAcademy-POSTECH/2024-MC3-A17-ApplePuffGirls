//
//  OnboardingStart.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 10/8/24.
//

import SwiftUI

struct OnboardingStart: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            VStack {
                Image(.cute)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                    .padding(.bottom, 30)
                
                Text("책빵장님, 책빵에 온 걸 환영해요!")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.typo100)
                    .kerning(-0.4)
                    .padding(.bottom, 50)
                
                Button(action: {
                    isFirstLaunching = false
                }, label: {
                    Text("입장하기")
                        .font(.bookCaption)
                        .frame(width: 120, height: 32)
                        .foregroundColor(.greenMain100)
                        .background(Capsule().fill(.clear))
                        .overlay(
                            Capsule()
                                .stroke(Color.greenMain100, lineWidth: 1)
                        )
                })
            }
        }
    }
}

#Preview {
    OnboardingStart(isFirstLaunching: .constant(false))
}
