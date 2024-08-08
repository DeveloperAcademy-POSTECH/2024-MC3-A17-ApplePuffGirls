//
//  AddPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/1/24.
//

import SwiftUI
import UIKit

struct AddPhrase: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    @State private var checkEmpty: Bool = false
    @State private var page: String = ""
    @State private var phrase: String = ""
    
    var book: Book
    
    @ObservedObject var phraseData: PhraseData = PhraseData()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: $checkEmpty,
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음",
                                onChevron: { detailBookViewModel.transition(to: .detailBook) },
                                onRightButton: { clickRightButton() })
            
            AddPhraseProgressBar()
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Image(.baking2)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundStyle(.greenMain40)
                            .frame(height: 14)
                            .padding(.bottom, -10)
                        
                        if let title = book.name {
                            Text("\"\(title)\"")
                                .foregroundStyle(.typo100)
                                .font(.system(size: 24, weight: .bold))
                                .padding(.bottom, 3)
                                .frame(maxWidth: UIScreen.main.bounds.width - 46)
                                .lineLimit(1)
                        }
                    }
                    .fixedSize()
                    
                    Text("책의 어느 부분을 구워볼까요?")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.bottom, 10)
                    
                    Text("책에서 마음에 와닿은 구절을 적어주세요")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 20)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal, 23)
            
            AddPhraseTextfield(checkEmpty: $checkEmpty,
                               page: $page,
                               phrase: $phrase)
                .padding(.horizontal, 22)
            
            Spacer()
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    private func clickRightButton() {
        let newPhraseData = PhraseData()
        newPhraseData.book = book
        newPhraseData.content = phrase
        newPhraseData.page = page
        detailBookViewModel.addPhraseData(newPhraseData)
        
        detailBookViewModel.transition(to: .addThoughts)
    }
}

func AddPhraseProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 3, height: 2)
                .background(.greenMain100)
        }
}
