//
//  OnboardingChapter.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 10/8/24.
//

import Foundation

struct OnboardingChapter: Hashable {
    var firstImage: String
    var firstContent: String
    var secondImage: String
    var secondContent: String
}

let onboardingChapter: [OnboardingChapter] = [
    OnboardingChapter(firstImage: "onboarding1",
                      firstContent: "책빵이라는 빵집이 있어요",
                      secondImage: "onboarding2",
                      secondContent: "책빵장인 냥스터는 빵이 안 팔려서 힘든 나날들을 보내고 있었어요"),
    OnboardingChapter(firstImage: "onboarding3",
                      firstContent: "냥스터는 빵의 재료인 책을 구하기 위한 고민을 하고 있었어요",
                      secondImage: "onboarding4",
                      secondContent: "여전히 책빵엔 손님이 없었어요"),
    OnboardingChapter(firstImage: "onboarding5",
                      firstContent: "책빵이 빵이 안팔려서 힘든 나날들을 보내고 있었어요",
                      secondImage: "onboarding6",
                      secondContent: "책빵장인 냥스터는 빵이 안팔려서 힘든 나날들을 보내고 있었어요"),
    OnboardingChapter(firstImage: "onboarding7",
                      firstContent: "책빵이 빵이 안팔려서 힘든 나날들을 보내고 있었어요",
                      secondImage: "onboarding8",
                      secondContent: "책빵장 냥스터를 도와주러 떠나볼까요?")
]
