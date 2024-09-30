//
//  ManualChapter.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/12/24.
//

import SwiftUI

struct ManualChapter: Hashable {
    var title: String
    var image: String
    var content: String
}

let manualChapter: [ManualChapter] = [
    ManualChapter(title: "책 반죽하기",
                  image: "mustacheCat",
                  content: "빵을 만들려면 재료가 필요하죠\n어떤 책을 재료로 반죽을 만들어볼까요?\n그리고 이 책은 어떤 맛이 나는지 들려주세요"),
    ManualChapter(title: "책빵 굽기",
                  image: "bookCat",
                  content: "좋아하는 문장으로 빵을 구워요\n책을 읽는 도중 인상 깊은 문장이 있다면 저희에게 알려주세요\n빵 반죽에 좋은 문장을 담아 맛있는 빵으로 만들어 줄게요"),
    ManualChapter(title: "오늘의 추천 빵",
                  image: "eatCat",
                  content: "하루에 두 번, 내가 만든 맛있는 빵 중\n하나를 추천해 드립니다\n설레는 마음으로 빵을 열어보세요\n\n[ 빵 나오는 시간 : 매일 오전 9시, 오후 6시 ]"),
    ManualChapter(title: "빵 클립",
                  image: "pencilCat",
                  content: "이 빵은 언제 먹으면 좋을지,\n어떤 특징을 가지고 있는지 클립으로 나누어 보아요\n내가 먹고 싶은 빵이 있을 때 더 쉽게 찾아볼 수 있어요"),
    ManualChapter(title: "빵수증",
                  image: "completeCat",
                  content: "일년에 두 번, 내가 구운 빵들의 대회가 열립니다\n지금까지 빵을 구운 기록들을 한 눈에 볼 수 있습니다\n많은 빵을 구울수록 더 재미있는 빵수증이 될 거에요")
]

