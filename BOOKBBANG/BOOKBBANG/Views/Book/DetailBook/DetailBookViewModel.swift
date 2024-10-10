//
//  DetailBookViewModel.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/8/24.
//

import Foundation

final class DetailBookViewModel: ObservableObject {
    @Published var viewStatus: DetailBookViewType = .detailBook
    @Published var newPhraseData: PhraseData? = nil
    @Published var newPhrase: Phrase? = nil
    
    @Published var progress: Int = 1
    
    func transition(to: DetailBookViewType) {
        DispatchQueue.main.async {
            self.viewStatus = to
        }
    }
    
    func addPhraseData(_ phraseData: PhraseData) {
        self.newPhraseData = phraseData
        print("newPhraseData: \(String(describing: newPhraseData))")
    }
    
    func addPhrase(_ phrase: Phrase) {
        self.newPhrase = phrase
        print("newPhrase: \(String(describing: newPhrase))")
    }
    
    func nextProgress() {
        if progress < 4 {
            progress += 1
        }
    }
    
    func backProgress() {
        if progress > 1 {
            progress -= 1
        }
    }
    
    func initProgress() {
        progress = 1
    }
}

enum DetailBookViewType {
    case detailBook
    
    case addPhrase
    case addThoughts
    case addClipToPhrase
    case addClipFinal
    
    case detailPhrase
}
