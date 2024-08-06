//
//  ReciptMain.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import SwiftUI

enum ReciptState {
    case startMakeRecipt
    case noRecipt
    case showRecipt
}

struct ReciptMain: View {
    @Environment(\.dismiss) var dismiss
    
    @State var reciptState: ReciptState = .showRecipt
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "빵수증",
                                onChevron: { dismiss() })
            
            VStack(spacing: 0) {
                switch reciptState {
                case .startMakeRecipt:
                    StartMakeRecipt()
                case .noRecipt:
                    NoRecipt()
                case .showRecipt:
                    ShowRecipt()
                }
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

// 앱 설치 날짜부터 ~ 빵수증 기간(시작일) 목록 구하기
func extractDates(from startDate: Date) -> [Date] {
    let today = Date()
    var extractedDates: [Date] = []
    let calendar = Calendar.current
    
    let startDateComponents = calendar.dateComponents([.year, .month], from: startDate)
    guard let year = startDateComponents.year, let month = startDateComponents.month else { return [] }
    
    let isBeforeJune = month < 6
    let startMonth = isBeforeJune ? 1 : 7
    
    var currentYear = year
    var currentMonth = startMonth
    
    while true {
        if let newDate = Date(y: currentYear, m: currentMonth, d: 1) {
            if newDate >= today {
                break
            }
            extractedDates.append(newDate)
        }
        
        // 6개월 간격으로 다음 날짜 설정
        if currentMonth == 1 {
            currentMonth = 7
        } else {
            currentMonth = 1
            currentYear += 1
        }
    }
    
    return extractedDates
}

// 빵수증 시작 날짜 넣으면 00년 상/하반기 문자열 리턴
func HalfYearToString(date: Date) -> String {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month], from: date)
    
    if let year = dateComponents.year, let month = dateComponents.month {
        return "\(year)년 \(month < 7 ? "상" : "하")반기"
    } else {
        return "선택하기"
    }
}

// 빵수증 날짜 기간 나타내는 문자열
func PeriodToString(date: Date) -> String {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month], from: date)
    
    guard let year = dateComponents.year, let month = dateComponents.month else { return "" }
    
    if month == 1 {
        return "\(year).\(month).1 - \(year).6.30"
    } else {
        return "\(year).\(month).1 - \(year).12.31"
    }
}

// 빵수증 기간 선택 뷰
struct SelectDate: View {
    // 앱 설치 날짜 = 2022.3.3 으로 가정해둠
    var dates: [Date] = extractDates(from: Date(y: 2022, m: 3, d: 3) ?? Date())
    
    // selectedDate = 현재 보여지는 빵수증의 시작 날짜
    // 빵수증 데이터 중에 제일 최근 것 보여지게 해야되는데 그거 어케하는지 몰르겠음 엉~ 엉~
    @State var selectedDate: Date = extractDates(from: Date())[0]
    
    var body: some View {
        VStack(spacing: 0) {
            Menu {
                Picker ("Date", selection: $selectedDate) {
                    ForEach(dates, id: \.self) { date in
                        Text(HalfYearToString(date: date)).tag(date)
                    }
                }
            } label: {
                HStack(spacing: 12) {
                    Text(HalfYearToString(date: selectedDate))
                        .font(.selectedDate)
                        .foregroundStyle(.typo100)
                    Image(systemName: "chevron.up.chevron.down")
                }
                .frame(height: 40)
            }
            .padding(.top, 25)
            
            Text(PeriodToString(date: selectedDate))
                .font(.datePeriod)
                .foregroundStyle(.typo50)
        }
        .padding(.bottom, 10)
    }
}


// 기간 내 빵수증을 발급할 데이터가 있을 때 (아직 발급 안했을 때)
struct StartMakeRecipt: View {
    var body: some View {
        VStack(spacing: 0) {
            SelectDate()
            TwoLineDivider()
            
            NavigationLink {
                RankingBooks()
            } label: {
                EmptyBox(width: 294, height: 305, text: "+  지금 빵수증 발급하기")
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

#Preview {
    NavigationStack {
        ReciptMain()
    }
}
