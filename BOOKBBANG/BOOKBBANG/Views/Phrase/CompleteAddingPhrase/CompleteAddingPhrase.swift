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
                .frame(width: .infinity, height: 2)
                .foregroundColor(.greenMain100)
            
            HeaderSection(title: "빵 굽기를 완료했습니다",
                          subtitle: "맛있는 빵을 만들었어요. 축하합니달라")
            .padding(.top, 150)
            .padding(.bottom, 50)
            
            Image(.oven)
                .resizable()
                .frame(width: 279,height: 269)
            
            Spacer()
        }
        .background(Color.backLighter)
    }
    
    private func clickRightButton() {
        book.phraseCount += 1
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        detailBookViewModel.transition(to: .detailBook)
    }
}

//#Preview {
//    CompleteAddingPhrase()
//}
