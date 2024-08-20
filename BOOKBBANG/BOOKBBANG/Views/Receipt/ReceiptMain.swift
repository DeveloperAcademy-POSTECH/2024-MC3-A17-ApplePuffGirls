//
//  ReciptMain.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/2/24.
//

import SwiftUI

struct ReceiptMain: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State var rankedBooks: [Book] = []
    
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
    
    var body: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron,
                                title: "빵수증",
                                onChevron: { homeViewModel.transition(to: .home) })
            
            VStack(spacing: 0) {
                SelectDate(selectedDate: $selectedDate)
                
                if !filteredReceipt.isEmpty {
                    // 빵수증이 있을 때
                    ShowReceipt(rankedBooks: $rankedBooks, selectedDate: $selectedDate)
                } else if isExistPhrase {
                    // 빵수증이 없고, 새로 만들 수 있을 때
                    StartMakeReceipt(homeViewModel: homeViewModel, rankedBooks: $rankedBooks)
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
        .navigationBarBackButtonHidden()
    }
}


// 기간 내 빵수증을 발급할 데이터가 있을 때 (아직 발급 안했을 때)
struct StartMakeReceipt: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var rankedBooks: [Book]
    
    var body: some View {
        VStack(spacing: 0) {
            TwoLineDivider()
            
            NavigationLink {
                RankingBooks(homeViewModel: homeViewModel,
                             rankedBooks: $rankedBooks)
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
            Image(.gentlemangyodong)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Text("                                          ㅅ \n(다다의 일러스트가 들어간다고 하네요?)")
            Spacer()
        }
    }
}

