//
//  ReciptMain.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import SwiftUI

struct ReciptMain: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var rankedBooks: [Book] = []
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "빵수증",
                                onChevron: { homeViewModel.transition(to: .home) })
            
            VStack(spacing: 0) {
                if rankedBooks.isEmpty {
                    // 빵수증 발급하기
                    StartMakeRecipt(homeViewModel: homeViewModel, rankedBooks: $rankedBooks)
                } else {
                    // 정기 빵수증 결과
                    ShowRecipt(rankedBooks: $rankedBooks)
                }
                
                // 빵수증 결과 아무것도 없을 때
                //NoRecipt()
                
            }
            .frame(maxWidth: .infinity)
            .background(.backDarker)
            .border(.typo10)
            .padding(.horizontal, 2)
            
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
    }
}

// 빵수증 기간 선택
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
            
            Text("2024.1.1 - 2020.6.31")
                .font(.datePeriod)
                .foregroundStyle(.typo50)
        }
        .padding(.bottom, 10)
    }
}



// 기간 내 빵수증을 발급할 데이터가 있을 때 (아직 발급 안했을 때)
struct StartMakeRecipt: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var rankedBooks: [Book]
    
    var body: some View {
        VStack(spacing: 0) {
            SelectDate()
            TwoLineDivider()
            
            NavigationLink {
                RankingBooks(homeViewModel: homeViewModel, rankedBooks: $rankedBooks)
            } label: {
                EmptyBox(width: 294, 
                         height: 305,
                         text: "+  지금 빵수증 발급하기", 
                         backgroundColor: .backDarker)
                    .padding(.top, 25)
            }
            
            Spacer()
        }
    }
}

// 기간 내 빵수증을 발급할 데이터가 없을 때
struct NoRecipt: View {
    var body: some View {
        VStack(spacing: 0) {
            SelectDate()
            TwoLineDivider()
            
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

