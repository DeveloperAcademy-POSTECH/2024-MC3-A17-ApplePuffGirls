//
//  SelectDate.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/20/24.
//

import SwiftUI

struct DateRange: Hashable {
    var year: Int
    var isFirstHalf: Bool
}

// 빵수증 기간 선택
struct SelectDate: View {
    // 앱 설치한 날짜 dummy
    // Jerrie Comment: 앱 설치한 날짜는 어떤 형식으로 저장해야 하나요? .. core data 상에 저장해두고 불러와서 써야 하나요 ?
    var installedDate: Date = Date(y: 2022, m: 9, d: 3) ?? Date()
    
    func setDateList() -> [DateRange] {
        let calendar = Calendar.current
        
        let installedYear: Int = calendar.component(.year, from: installedDate)
        let installedIsFirstHalf: Bool = calendar.component(.month, from: installedDate) < 7 ? true : false
        
        let current = Date()
        let currentYear: Int = calendar.component(.year, from: current)
        let currentIsFirstHalf: Bool = calendar.component(.month, from: current) < 7 ? true : false
        
        var list: [DateRange] = []
        
        // 시작 년도, 중간 년도들, 현재 년도 ..
        // 앱 설치 시작 년도
        if installedYear != currentYear {
            if installedIsFirstHalf {
                list.append(DateRange(year: installedYear, isFirstHalf: true))
            }
            list.append(DateRange(year: installedYear, isFirstHalf: false))
        }
        
        // 현재 년도 이전까지 ..
        for year in (installedYear+1)..<currentYear {
            list.append(DateRange(year: year, isFirstHalf: true))
            list.append(DateRange(year: year, isFirstHalf: false))
        }
        
        // 현재 년도
        list.append(DateRange(year: currentYear, isFirstHalf: true))
        if !currentIsFirstHalf {
            list.append(DateRange(year: currentYear, isFirstHalf: false))
        }
        
        return list
    }
    
    @State var dateList: [DateRange] = []
    @Binding var selectedDate: DateRange
    //@State private var selectedDate: DateRange = DateRange(year: 2024, isFirstHalf: true)
    
    var body: some View {
        VStack(spacing: 0) {
            Menu {
                Picker ("Date", selection: $selectedDate) {
                    ForEach(dateList, id: \.self) { date in
                        Text("\(String(date.year))년 \(date.isFirstHalf ? "상" : "하")반기").tag(date)
                    }
                }
            } label: {
                HStack(spacing: 12) {
                    Text("\(String(selectedDate.year))년 \(selectedDate.isFirstHalf ? "상" : "하")반기")
                        .font(.selectedDate)
                        .foregroundStyle(.typo100)
                    Image(systemName: "chevron.up.chevron.down")
                }
                .frame(height: 40)
            }
            .padding(.top, 25)
            
            if selectedDate.isFirstHalf {
                Text("\(String(selectedDate.year)).1.1 - \(String(selectedDate.year)).6.31")
                    .font(.datePeriod)
                    .foregroundStyle(.typo50)
            } else {
                Text("\(String(selectedDate.year)).7.1 - \(String(selectedDate.year)).12.31")
                    .font(.datePeriod)
                    .foregroundStyle(.typo50)
            }
        }
        .padding(.bottom, 10)
        .onAppear {
            dateList = setDateList()
            selectedDate = dateList.last ?? DateRange(year: 2024, isFirstHalf: true)
        }
    }
}

#Preview {
    SelectDate(selectedDate: .constant(DateRange(year: 2024, isFirstHalf: true)))
}
