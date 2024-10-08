//
//  Onboarding.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 9/29/24.
//

import SwiftUI

struct Onboarding: View {
    @State private var isStartViewActive: Bool = false
    @Binding var isFirstLaunching: Bool
    @AppStorage("installedDate") var installDate: Double?
    
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text("책빵 시작하기")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 18, weight: .semibold))
                        .kerning(-0.4)
                    Spacer()
                }
                .frame(height: 55)
                .background(.backLighter)
                
                TabView {
                    ForEach(onboardingChapter, id: \.self) { chapter in
                        OnboardingEachChapter(chapter: chapter)
                    }
                    
                    OnboardingStart(isFirstLaunching: $isFirstLaunching)
                }
                .tabViewStyle(.page)
                .padding(.top, 50)
            }
        }
        .onAppear {
            installDate = Date().timeIntervalSince1970
        }
        .onDisappear {
            isFirstLaunching = false
        }
    }
}

struct OnboardingEachChapter: View {
    var chapter: OnboardingChapter
    
    var body: some View {
        VStack {
            Image(chapter.firstImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(chapter.firstContent)
                .font(.segment)
                .foregroundStyle(.typo100)
                .multilineTextAlignment(.center)
                .kerning(-0.4)
            
            Spacer()
            
            Image(chapter.secondImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(chapter.secondContent)
                .font(.segment)
                .foregroundStyle(.typo100)
                .multilineTextAlignment(.center)
                .kerning(-0.4)
            
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}
