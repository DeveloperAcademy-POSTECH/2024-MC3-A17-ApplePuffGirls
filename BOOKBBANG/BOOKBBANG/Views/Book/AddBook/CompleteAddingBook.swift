//
//  CompleteAddingBook.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/1/24.
//

import SwiftUI
import CoreData

struct CompleteAddingBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack{
            CompleteAddingPhraseHeader(title: "새로운 책 추가하기",
                                       onComplete: { clickRightButton() })
            
            SearchBookProgressBar(process: 4)
            
            //TODO: - 책 장르에 따른 빵 종류 연결하기
            HeaderSection(title: "책 추가를 완료했습니다",
                          subtitle: "이 책으론 메론빵을 만들 수 있어요!")
            .padding(.top, 28)
            .padding(.bottom, 100)
            
            Image(.completeBread)
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        homeViewModel.transition(to: .home)
    }
}

#Preview {
    CompleteAddingBook(homeViewModel: HomeViewModel())
}
