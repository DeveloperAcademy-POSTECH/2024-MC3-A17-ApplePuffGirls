//
//  DetailBookViewModel.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/8/24.
//

import Foundation

final class DetailBookViewModel: ObservableObject {
    @Published var viewStatus: DetailBookViewType = .detailBook
    @Published var newPhrase: Phrase? = nil
    
    func transition(to: DetailBookViewType) {
        DispatchQueue.main.async {
            self.viewStatus = to
        }
    }
    
    func addPhrase(_ phrase: Phrase) {
        self.newPhrase = phrase
        print("newPhrase: \(String(describing: newPhrase))")
    }
}

enum DetailBookViewType {
    case detailBook
    
    case addPhrase
    case addThoughts
    case addClipToPhrase
    case addClipFinal
}
