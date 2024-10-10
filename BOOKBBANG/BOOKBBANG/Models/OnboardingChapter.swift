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
                      firstContent: "'책빵'이라는 빵집이 있었어요",
                      secondImage: "onboarding2",
                      secondContent: "책빵장인 냥스터는 빵을 만들 수 없어서 힘든 나날들을 보내고 있었어요"),
    OnboardingChapter(firstImage: "onboarding5",
                      firstContent: "사람들이 책을 읽으면 다양한 생각들이 나오는데",
                      secondImage: "onboarding6",
                      secondContent: "그게 빵의 재료가 돼요"),
    OnboardingChapter(firstImage: "onboarding3",
                      firstContent: "근데 지금은 빵을 만들 수가 없어요",
                      secondImage: "onboarding4",
                      secondContent: "왜냐면 사람들이 책을 하나도 읽지 않거든요"),
    OnboardingChapter(firstImage: "onboarding7",
                      firstContent: "그래서 파리만 날리는 '책빵 베이커리' ..",
                      secondImage: "onboarding8",
                      secondContent: "책빵장 냥스터를 도와주세요!")
]
