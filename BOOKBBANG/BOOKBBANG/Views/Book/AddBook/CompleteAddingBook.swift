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
    
    @Binding var bookData: BookData
    
    var body: some View {
        VStack(spacing: 0){
            CompleteAddingPhraseHeader(title: "새로운 책 추가하기",
                                       onComplete: { clickRightButton() })
            
            CustomProgressBar(process: $homeViewModel.progress, count: 3)
            
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text("책 추가를 완료했습니다")
                        .font(.addBookTitle)
                        .foregroundStyle(.typo100)
                        .padding(.bottom, 1)
                    
                    if let matchingGenre = BookGenre.fromDescription(bookData.genre) {
                        HStack(spacing: 0) {
                            Text("이 책으론 ")
                                .font(.bookCaption)
                                .foregroundStyle(.typo50)
                            Text("\(matchingGenre.breadName)")
                                .font(.bookCaptionBold)
                                .foregroundStyle(.typo80)
                            Text("을(를) 만들 수 있어요!")
                                .font(.bookCaption)
                                .foregroundStyle(.typo50)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.top, 28)
            .padding(.bottom, 100)
            
            Image(.completeBread)
                .resizable()
                .scaledToFit()
                .frame(width: 280)
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        homeViewModel.initProgress()
        homeViewModel.transition(to: .home)
    }
}
