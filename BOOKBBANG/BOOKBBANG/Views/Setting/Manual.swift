//
//  Manual.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI

struct ManualChapter: Hashable {
    var title: String
    var image: String
    var context: String
}

struct Manual: View {
    let manualChapter: [ManualChapter] = [
        ManualChapter(title: "책 반죽하기", image: "fish_1", context: "책은 우리가 만들 빵의 재료에요. 어떤 책으로 반죽을 만들어볼까요? 그 책은 어떤 맛인지 알려주세요!"),
        ManualChapter(title: "책빵 굽기", image: "fish_2", context: "책 속 좋아하는 문장으로 빵을 구워보세요! 빵 반죽에 문장을 담아 맛있는 빵을 만들어 줄게요."),
        ManualChapter(title: "오늘의 빵", image: "fish_3", context: "하루에 두 번, 내가 만든 빵들 중 하나를 추천해드려요. 설레는 마음으로 빵을 기다려보세요!"),
        ManualChapter(title: "빵 클립", image: "fish_4", context: "이 빵을 언제 먹을지, 어떤 맛인지 빵 클립으로 묶어 보아요. 내가 먹고 싶을 때 더 쉽게 찾아 먹을 수 있어요!"),
        ManualChapter(title: "빵수증", image: "fish_6", context: "일 년에 두 번, 내가 구운 빵들의 영수증이 만들어져요! 지금까지 구운 빵 기록들을 한 눈에 볼 수 있죠. 어떤 빵이 가장 많이 만들어졌는지 궁금하지 않나요? 빵을 많이 구울 수록 더 재미있는 빵수증이 될 거에요.")
]
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false), navigationType: .chevron, title: "책빵 사용설명서")
            
            TabView {
                ManualCover()
                
                ForEach(manualChapter, id: \.self) { chapter in
                    ShowEachChapter(chapter: chapter)
                }
            }
            .padding(.bottom, 40)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .background(.backLighter)
    }
}

#Preview {
    NavigationStack {
        Manual()
    }
}

struct ShowEachChapter: View {
    var chapter: ManualChapter
    
    var body: some View {
        VStack(spacing: 0) {
            Text(chapter.title)
                .font(.teamMemberTitle)
                .foregroundStyle(.greenMain100)
                .padding(.bottom, 20)
            
            Image(chapter.image)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            
            Text(chapter.context)
                .font(.segment)
                .foregroundStyle(.typo100)
                .frame(width: 330)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            if chapter.title == "오늘의 빵" {
                Text("* 오늘의 빵은 위젯을 이용해 더 자주 볼 수 있어요.")
                    .font(.bookCaption)
                    .foregroundStyle(.typo80)
                    .padding(.top, 8)
                    .padding(.bottom, 20)
                    
                Text("[빵 나오는 시간 : 매일 오전 9:00, 오후 6:00]")
                    .font(.segment)
                    .foregroundStyle(.typo100)
            }
        }
    }
}

struct ManualCover: View {
    var body: some View {
        VStack {
            Image("gentlemangyodong")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("책빵장님, 책빵에 온 걸 환영해요!")
                .font(.segment)
                .foregroundStyle(.typo100)
                .padding(.bottom, 10)
            
            Text("오른쪽으로 넘겨 책빵 사용법을 알아보세요.")
                .font(.bookCaption)
                .foregroundStyle(.typo50)
        }
    }
}
