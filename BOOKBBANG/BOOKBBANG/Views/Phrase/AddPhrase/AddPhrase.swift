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
    @StateObject private var liveTextViewModel = LiveTextViewModel()
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    @State private var checkEmpty: Bool = false
    @State private var phrase: String = ""
    
    var book: Book
    
    @ObservedObject var phraseData: PhraseData = PhraseData()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomNavigationBar(isHighlighted: $checkEmpty,
                                    navigationType: .chevron,
                                    title: "새로운 빵 굽기",
                                    rightTitle: "다음",
                                    onChevron: { clickBackButton() },
                                    onRightButton: { clickNextButton() })
                
                CustomProgressBar(process: $detailBookViewModel.progress, count: 4)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundStyle(.greenSub50)
                                .frame(height: 14)
                                .padding(.bottom, -5)
                            
                            if let title = book.name {
                                Text("\"\(title)\"")
                                    .foregroundStyle(.typo100)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.bottom, 3)
                                    .frame(maxWidth: UIScreen.main.bounds.width - 46)
                                    .lineLimit(1)
                            }
                        }
                        .fixedSize()
                        
                        Text("책의 어느 부분을 구워볼까요?")
                            .foregroundStyle(.typo100)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom, 4)
                        
                        Text("책을 재료삼아 빵을 구울 수 있습니다")
                            .foregroundStyle(.typo50)
                            .font(.system(size: 13, weight: .regular))
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 23)
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: {
                        AddPhraseScanner(liveTextViewModel: liveTextViewModel)
                            .task {
                                await liveTextViewModel.requestDataScannerAccessStatus()
                            }
                    }, label: {
                        RoundedRectangle(cornerRadius: 29)
                            .stroke(.greenMain100, lineWidth: 1.0)
                            .frame(width: 120 ,height: 32)
                            .overlay {
                                HStack {
                                    Image(systemName: "text.viewfinder")
                                        .font(.system(size: 13))
                                    
                                    Text("구절 가져오기")
                                        .foregroundStyle(.greenMain100)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding(10)
                            }
                    })
                }
                .padding(.trailing, 28)
                
                AddPhraseTextfield(checkEmpty: $checkEmpty,
                                   phrase: $phrase)
                .padding(.horizontal, 22)
                .padding(.bottom, 10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(.book)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.trailing, 22)
                }
            }
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    private func clickBackButton() {
        detailBookViewModel.backProgress()
        detailBookViewModel.transition(to: .detailBook)
    }
    
    private func clickNextButton() {
        let newPhraseData = PhraseData()
        newPhraseData.book = book
        newPhraseData.content = phrase
        detailBookViewModel.addPhraseData(newPhraseData)
        
        detailBookViewModel.nextProgress()
        detailBookViewModel.transition(to: .addThoughts)
    }
}
