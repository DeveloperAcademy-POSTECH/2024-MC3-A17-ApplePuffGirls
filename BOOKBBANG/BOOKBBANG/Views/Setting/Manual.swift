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
    @Environment(\.dismiss) var dismiss
    let manualChapter: [ManualChapter] = [
        ManualChapter(title: "책 반죽하기", image: "Baking_1", context: "책은 우리가 만들 빵의 재료에요.\n어떤 책으로 반죽을 만들어볼까요?\n그 책은 어떤 맛인지 알려주세요!"),
        ManualChapter(title: "책빵 굽기", image: "Baking_3", context: "좋아하는 문장으로 빵을 구워보아요!\n책을 읽는 도중 인상 깊은 문장이 있다면\n저희에게 알려주세요.\n빵 반죽에 좋은 문장을 담아!\n맛있는 빵으로 만들어 줄게요."),
        ManualChapter(title: "오늘의 빵", image: "Congratulatory_bread", context: "하루에 두 번, 내가 만든 맛있는 빵 중\n하나씩 추천해 드립니다.\n이번엔 어떤 빵이 나올지 기대되지 않나요?\n설레는 마음으로 빵을 열어보세요!"),
        ManualChapter(title: "빵 클립", image: "CloverClip", context: "이 빵은 언제 먹으면 좋을지,\n어떤 특징을 가지고 있는지 클립으로 나누어보아요.\n내가 먹고싶은 빵이 있을 때 더 쉽게 찾아볼 수 있어요!"),
        ManualChapter(title: "빵수증", image: "Receipt", context: "일 년에 두 번, 내가 구운 빵들의 대회가 열립니다.\n지금까지 빵을 구운 기록들을 한 눈에 볼 수 있죠.\n마치 영수증처럼요!\n어떤 빵이 가장 많이 만들어졌을지 궁금하지 않으세요?\n많은 빵을 구울 수록 더 재미있는 빵수증이 될 거예요.")
    ]
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "책빵 사용 설명서",
                                onChevron: { dismiss() })
            
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
        .navigationBarBackButtonHidden()
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
                .kerning(-0.4)
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
            Image(.gentlemangyodong)
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
