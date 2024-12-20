//
//  ReciptMain.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import SwiftUI

struct ReceiptMain: View {
    @FetchRequest(entity: Receipt.entity(), sortDescriptors: [])
    private var receipts: FetchedResults<Receipt>
    
    @FetchRequest(entity: Phrase.entity(), sortDescriptors: [])
    private var phrases: FetchedResults<Phrase>
    
    @State private var selectedDate: DateRange = DateRange(year: 2024, isFirstHalf: true)
    
    var filteredReceipt: [Receipt] {
        receipts.filter { $0.year == selectedDate.year && $0.isFirstHalf == selectedDate.isFirstHalf }
    }
    
    // 기간 내 등록한 구절이 있나요?
    var isExistPhrase: Bool {
        let startDate = Date(y: selectedDate.year, m: selectedDate.isFirstHalf ? 1 : 7, d: 1) ?? Date()
        let endDate = Date(y: selectedDate.year, m: selectedDate.isFirstHalf ? 6 : 12, d: 31) ?? Date()
        
        let filteredPhrases = phrases.filter { phrase in
            guard let createdDate = phrase.createdDate else {
                return false
            }
            
            if createdDate >= startDate && createdDate <= endDate {
                return true
            }
            return false
        }
        
        if !filteredPhrases.isEmpty {
            return true
        }
        return false
    }
    
    // 현재 기간이 지난 후인지?
    var isPastEndDate: Bool {
        let endDate = Date(y: selectedDate.year, m: selectedDate.isFirstHalf ? 6 : 12, d: 31) ?? Date()
        return endDate < Date() ? true : false
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                SelectDate(selectedDate: $selectedDate)
                
                if !filteredReceipt.isEmpty {
                    // 빵수증이 있을 때
                    ForEach(filteredReceipt) { receipt in
                        ShowReceipt(selectedDate: $selectedDate, receipt: receipt)
                    }
                } else if !isPastEndDate { // 빵수증 테스트할 때 여기 느낌표만 지우고 test 해보면 됨니다.
                    // 빵수증을 제작할 기간이 아닐 때
                    NotYetReceipt()
                } else if isExistPhrase {
                    // 빵수증이 없고, 새로 만들 수 있을 때
                    StartMakeReceipt(selectedDate: selectedDate)
                } else {
                    // 데이터가 없어 빵수증을 발급할 수 없을 때
                    NoRecipt()
                }
            }
            .frame(maxWidth: .infinity)
            .background(.backDarker)
            .border(.typo10)
            .padding(.horizontal, 2)
            
        }
        .background(.backLighter)
        .toolbar {
            ToolbarItem(placement: .principal) {
             Text("빵수증")
                    .font(.navigation)
                    .kerning(-0.4)
                    .foregroundStyle(.typo100)
            }
        }
    }
}


// 기간 내 빵수증을 발급할 데이터가 있을 때 (아직 발급 안했을 때)
struct StartMakeReceipt: View { 
    var selectedDate: DateRange
    
    var body: some View {
        VStack(spacing: 0) {
            TwoLineDivider()
            
            NavigationLink {
                RankingBooks(selectedDate: selectedDate)
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
            
            TwoLineDivider()
            
            Text("기간동안 읽은 책이 없어\n빵수증을 발급할 수 없어요")
                .font(.listTitle)
                .foregroundStyle(.typo100)
                .lineSpacing(14)
                .multilineTextAlignment(.center)
                .padding(.vertical, 35)
            
            TwoLineDivider()
            
            Spacer()
            Image(.mustache)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Spacer()
        }
    }
}

// 빵수증을 제작할 기간이 아닐 때
struct NotYetReceipt: View {
    var body: some View {
        VStack(spacing: 0) {
            
            TwoLineDivider()
            
            Text("아직 빵수증 제작 기간이 아니에요.")
                .font(.listTitle)
                .foregroundStyle(.typo100)
                .lineSpacing(14)
                .multilineTextAlignment(.center)
                .padding(.vertical, 35)
            
            TwoLineDivider()
            
            Spacer()
            // 추후 이미지 변경 될 수 있음
            Image(.mustache)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Spacer()
        }
    }
}

