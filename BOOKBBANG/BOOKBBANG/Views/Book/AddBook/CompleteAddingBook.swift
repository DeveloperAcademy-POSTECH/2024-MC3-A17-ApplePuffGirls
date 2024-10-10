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
            
            HeaderSection(title: "책 추가를 완료했습니다",
                          subtitle: "맛있는 빵을 만들러 가볼까요?")
            .padding(.top, 20)
            .padding(.bottom, 50)
            
            Image(.baking2)
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        homeViewModel.transition(to: .home)
        homeViewModel.selectedBook = nil
    }
}

#Preview {
    CompleteAddingBook(homeViewModel: HomeViewModel())
}
