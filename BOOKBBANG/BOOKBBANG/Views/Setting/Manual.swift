
//
//  Manual.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/1/24.
//

import SwiftUI


enum DisplayManual {
    case setting
    case onboarding
}

struct Manual: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isClipImage: Bool = false
    @Binding var isFirstLaunching: Bool
    var display: DisplayManual = .setting
    
    var body: some View {
        VStack {
            if display == .setting {
                CustomNavigationBar(isHighlighted: .constant(false),
                                    navigationType: .chevron,
                                    title: "책빵 사용 설명서",
                                    onChevron: { dismiss() })
            }
            
            TabView {
                ManualCover()
                
                ForEach(manualChapter, id: \.self) { chapter in
                    ShowEachChapter(isFirstLaunching: $isFirstLaunching, 
                                    isClipImage: chapter.title == "빵 클립",
                                    display: display,
                                    chapter: chapter)
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
    @Binding var isFirstLaunching: Bool
    var isClipImage: Bool
    var display: DisplayManual
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
                .frame(width: isClipImage ? 100 : 180, height: 180)
            
            Text(chapter.content)
                .lineSpacing(6)
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
            
            if chapter.title == "빵수증" && display == .onboarding {
                Button(action: {
                    isFirstLaunching.toggle()
                }, label: {
                    HStack {
                        Spacer()
                        Text("책빵으로 가기")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.backLighter)
                            .padding()
                        Spacer()
                    }
                    .background(.greenMain100)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                .padding(.top, 30)
                .padding(.horizontal, 20)
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
