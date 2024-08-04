//
//  ReciptMain.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import SwiftUI

struct ReciptMain: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 0) {
                SelectDate()
                
                TwoLineDivider()
                
                //StartMakeRecipt()
                
                //NoRecipt()
                
                VStack {
                // 정기 빵수증 결과
                    HStack {
                        Text("기간 동안 읽은 책")
                        Spacer()
                        Text("5권")
                    }
                    HStack {
                        Text("가장 많이 읽은 장르")
                        Spacer()
                        Text("추리/미스테리")
                    }
                    TwoLineDivider()
                    HStack {
                        Text("기준")
                        Spacer()
                        Text("가장 인상 깊은 책 3순위")
                    }
                    
                    DashLineDivider()
                    HStack {
                        Text("당신이 누군가를 죽였다")
                        Spacer()
                        Text("1위")
                        
                    }
                    HStack {
                        Text("당신이 누군가를 죽였다")
                        Spacer()
                        Text("1위")
                        
                    }
                    HStack {
                        Text("당신이 누군가를 죽였다")
                        Spacer()
                        Text("1위")
                        
                    }
                    
                    HStack(spacing: 36) {
                        Image(.fish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76)
                        Image(.fish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76)
                        Image(.fish2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 76)
                    }
                    
                    DashLineDivider()
                    HStack {
                        Text("기준")
                        Spacer()
                        Text("가장 인상 깊은 문구 3 순위")
                    }
                    DashLineDivider()
                    
                    HStack {
                        Text("당신이 누군가를 죽였다")
                        Spacer()
                        Text("12p")
                    }
                    Text("그리고는, 안고 온 꽃묶음 속에서 가지가 꺾이고 꽃이 일그러진 송이를 골라 발 밑에 버린다. 소녀는 소년이 개울둑에 앉아 있는 걸 아는지 모르는지 그냥 날쌔게 물만 움켜 낸다.")
                    HStack {
                        Spacer()
                        Text("문구 순위 : 1")
                    }
                    DashLineDivider(half: true)
                    
                    
                    Spacer()
                    
                }
                .frame(width: 300)
                
            }
            .background(.backLighter)
        }
        .navigationTitle("정기 빵수증")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

func makeStartDateList() -> [Date] {
    let today = Date()
    let calendar = Calendar.current
    
    return [Date()]
}

struct SelectDate: View {
    var dates: [String] = [ "2022년 상반기", "2022년 하반기", "2023년 상반기", "2023년 하반기", "2024년 상반기"]
    @State private var selectedDate: String = "2024년 상반기"
    
    var body: some View {
        VStack(spacing: 0) {
            Menu {
                Picker ("Date", selection: $selectedDate) {
                    ForEach(dates, id: \.self) { date in
                        Text(date).tag(date)
                    }
                }
                
            } label: {
                HStack(spacing: 12) {
                    Text(selectedDate)
                        .font(.selectedDate)
                        .foregroundStyle(.typo100)
                    Image(systemName: "chevron.up.chevron.down")
                }
                .frame(height: 40)
            }
            .padding(.top, 25)
            
            Text("2020.7.1 - 2020.12.31")
                .font(.datePeriod)
                .foregroundStyle(.typo50)
        }
        .padding(.bottom, 25)
    }
}

// 기간 내 빵수증을 발급할 데이터가 있을 때 (아직 안했을 때)
struct StartMakeRecipt: View {
    var body: some View {
        VStack(spacing: 0) {
            EmptyBox(width: 294, height: 305, text: "+  지금 빵수증 발급하기")
                .padding(.top, 25)
            
            Spacer()
        }
    }
}

// 기간 내 빵수증을 발급할 데이터가 없을 때
struct NoRecipt: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("기간동안 읽은 책이 없어\n빵수증을 발급할 수 없어요")
                .font(.listTitle)
                .foregroundStyle(.typo100)
                .lineSpacing(14)
                .multilineTextAlignment(.center)
                .padding(.vertical, 35)
            
            TwoLineDivider()
            
            Spacer()
            Image(.gentlemangyodong)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Text("                                          ㅅ \n(다다의 일러스트가 들어간다고 하네요?)")
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ReciptMain()
    }
}
