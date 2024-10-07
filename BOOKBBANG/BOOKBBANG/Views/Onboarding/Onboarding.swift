//
//  Onboarding.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 9/29/24.
//

import SwiftUI

struct Onboarding: View {
    @Binding var isFirstLaunching: Bool
    @AppStorage("installedDate") var installDate: Double?
    
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: .constant(false), navigationType: .chevron, title: "책빵 시작하기")

                    TabView {
                        ForEach(onboardingChapter, id: \.self) { chapter in
                            OnboardingEachChapter(chapter: chapter)
                        }
                    }
                    .tabViewStyle(.page)
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
                .font(.phraseBottom)
                .foregroundStyle(.typo100)
            
            Spacer()
            Image(chapter.secondImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(chapter.secondContent)
                .font(.phraseBottom)
                .foregroundStyle(.typo100)

            Spacer()
        }
    }
}

#Preview {
    Onboarding(isFirstLaunching: .constant(true))
}
