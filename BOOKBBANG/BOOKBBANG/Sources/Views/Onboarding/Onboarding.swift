//
//  Onboarding.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 9/29/24.
//

import SwiftUI

struct Onboarding: View {
    @State private var isStartViewActive: Bool = false
    @State private var currentPage: Int = 0
    @Binding var isFirstLaunching: Bool
    @AppStorage("installedDate") var installDate: Double?
    
    var body: some View {
        ZStack {
            Color.backLighter.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    if currentPage > 0 {
                        Button(action: {
                            currentPage -= 1
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.greenMain100)
                                .font(.system(size: 18, weight: .bold))
                        })
                        .padding(.leading, 24)
                    }
                    else {
                        Button(action: {}, label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.backLighter)
                                .font(.system(size: 18, weight: .bold))
                        })
                        .padding(.leading, 24)
                    }
                    
                    Spacer()
                    
                    Text("책빵 시작하기")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 18, weight: .semibold))
                        .kerning(-0.4)
                    
                    Spacer()
                    
                    if currentPage < onboardingChapter.count {
                        Button(action: {
                            currentPage += 1
                        }, label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.greenMain100)
                                .font(.system(size: 18, weight: .bold))
                        })
                        .padding(.trailing, 24)
                    }
                    else {
                        Button(action: {}, label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.backLighter)
                                .font(.system(size: 18, weight: .bold))
                        })
                        .padding(.leading, 24)
                    }
                }
                .frame(height: 55)
                .background(.backLighter)
                
                TabView(selection: $currentPage) {
                    ForEach(0..<onboardingChapter.count, id: \.self) { index in
                        OnboardingEachChapter(chapter: onboardingChapter[index])
                            .tag(index)
                    }
                    
                    OnboardingStart(isFirstLaunching: $isFirstLaunching)
                        .tag(onboardingChapter.count)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, 40)
            }
        }
        .onAppear {
            installDate = Date().timeIntervalSince1970
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
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.typo100)
                .multilineTextAlignment(.center)
                .kerning(-0.4)
                .padding(.top, 10)
            
            Spacer()
            
            Image(chapter.secondImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(chapter.secondContent)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.typo100)
                .multilineTextAlignment(.center)
                .kerning(-0.4)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding(.horizontal, 30)
    }
}
