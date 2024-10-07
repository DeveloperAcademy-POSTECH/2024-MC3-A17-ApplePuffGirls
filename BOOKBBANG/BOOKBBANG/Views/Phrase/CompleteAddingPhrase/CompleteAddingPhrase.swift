//
//  CompleteAddingPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/3/24.
//

import SwiftUI

struct CompleteAddingPhrase: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 0) {
            CompleteAddingPhraseHeader(title: "새로운 빵 굽기",
                                       onComplete: { clickRightButton() })
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 2)
                .foregroundColor(.greenMain100)
            
            HeaderSection(title: "빵 굽기를 완료했습니다",
                          subtitle: "맛있는 빵을 만들었어요. 축하합니달라")
            .padding(.top, 20)
            .padding(.bottom, 130)
            
            Image(.completePhrase)
                .resizable()
                .frame(width: 290, height: 290)
            
            Spacer()
        }
        .background(Color.backLighter)
    }
    
    private func clickRightButton() {
        detailBookViewModel.transition(to: .detailBook)
    }
}
