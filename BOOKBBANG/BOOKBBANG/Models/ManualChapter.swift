//
//  ManualChapter.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/12/24.
//

import Foundation

struct ManualChapter: Hashable {
    var title: String
    var image: String
    var content: String
}

let manualChapter: [ManualChapter] = [
    ManualChapter(title: "책 반죽하기", 
                  image: "Baking_1",
                  content: "책은 우리가 만들 빵의 재료에요.\n어떤 책으로 반죽을 만들어볼까요?\n그 책은 어떤 맛인지 알려주세요!"),
    ManualChapter(title: "책빵 굽기",
                  image: "Baking_3", 
                  content: "책 속 좋아하는 문장으로 빵을 구워보아요!\n빵 반죽에 문장을 담아!\n맛있는 빵으로 만들어 줄게요."),
    ManualChapter(title: "오늘의 빵",
                  image: "Congratulatory_bread",
                  content: "하루에 두 번, 내가 만든 빵들 중\n하나씩 추천해 드립니다.\n설레는 마음으로 빵을 열어보세요!"),
    ManualChapter(title: "빵 클립",
                  image: "CloverClip",
                  content: "이 빵을 언제 먹을지, 어떤 맛인지\n 빵 클립으로 나누어보아요.\n내가 먹고싶을 때 더 쉽게 찾아 먹을 수 있어요!"),
    ManualChapter(title: "빵수증",
                  image: "Receipt",
                  content: "일 년에 두 번, 내가 구운 빵들의 영수증이 만들어져요!.\n지금까지 빵을 구운 기록들을 한 눈에 볼 수 있죠.\n어떤 빵이 가장 많이 만들어졌을지 궁금하지 않나요?\n많은 빵을 구울 수록 더 재미있는 빵수증이 될 거예요.")
]

