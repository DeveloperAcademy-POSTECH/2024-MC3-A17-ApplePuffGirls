//
//  ShowRecipt.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/5/24.
//

import SwiftUI

// 빵수증이 있을 때
struct ShowRecipt: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SelectDate()
                TwoLineDivider()
                
                // 기간동안 읽은 책, 가장 많이 읽은 장르
                VStack(spacing: 15) {
                    HStack {
                        Text("기간 동안 읽은 책")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text("5권")
                            .font(.segmentSelected)
                            .foregroundStyle(.typo80)
                    }
                    
                    HStack {
                        Text("가장 많이 읽은 장르")
                            .font(.segment)
                            .foregroundStyle(.typo50)
                        Spacer()
                        Text("추리/미스테리")
                            .font(.segmentSelected)
                            .foregroundStyle(.typo80)
                    }
                }
                .frame(width: 300)
                
                TwoLineDivider()
                
                Text("가장 인상 깊은 책 3 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(1..<4) { i in
                        HStack {
                            Text("당신이 누군가를 죽였다")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(i)위")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(1..<4) { _ in
                        Image(.fish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76)
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                DashLineDivider()
                Text("가장 인상 깊은 문구 3 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                
                DashLineDivider()
                VStack(spacing: 0) {
                    ForEach(1..<4) { i in
                        VStack(spacing: 0)
                        {
                            HStack {
                                Text("당신이 누군가를 죽였다")
                                Spacer()
                                Text("\(i)위")
                            }
                            .font(.segment)
                            .foregroundStyle(.typo50)
                            .padding(.bottom, 10)
                            
                            Text("그리고는, 안고 온 꽃묶음 속에서 가지가 꺾이고 꽃이 일그러진 송이를 골라 발 밑에 버린다. 소녀는 소년이 개울둑에 앉아 있는 걸 아는지 모르는지 그냥 날쌔게 물만 움켜 낸다.")
                                .lineSpacing(10)
                                .font(.phraseAtRecipt)
                                .foregroundStyle(.typo100)
                        }
                    }
                    .padding(.vertical, 15)
                }
                .frame(width: 300)
                
                TwoLineDivider()
                
                Text("가장 빵을 많이 구운 책 3 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(1..<4) { i in
                        HStack {
                            Text("당신이 누군가를 죽였다")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(i)개")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                // 책 이미지 3개
                HStack(spacing: 36) {
                    ForEach(1..<4) { _ in
                        Image(.fish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76)
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 20)
                
                DashLineDivider()
                Text("가장 빵을 많이 담은 클립 3 순위")
                    .font(.listTitle)
                    .foregroundStyle(.typo80)
                DashLineDivider()
                
                VStack(spacing: 15) {
                    ForEach(1..<4) { i in
                        HStack {
                            Text("당신이 누군가를 죽였다")
                                .font(.segmentSelected)
                                .foregroundStyle(.typo100)
                            Spacer()
                            Text("\(i)개")
                                .font(.segment)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                .frame(width: 300)
                
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ShowRecipt()
}
