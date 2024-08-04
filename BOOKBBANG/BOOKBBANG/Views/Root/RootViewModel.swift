//
//  RootViewModel.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/4/24.
//

import Foundation
import SwiftUI

final class RootViewModel: ObservableObject {
    // current presenting view type
    @Published var currentView: ViewType = .home
    
    // View Transition
    func transition(to viewType: ViewType) {
        // Main Thread에서 실행 보장
        DispatchQueue.main.async {
            withAnimation(.spring(duration: 0.2, bounce: 0.3)) {
                self.currentView = viewType
            }
        }
    }
}

enum ViewType: String {
    // home
    case home
    
//    //detail
//    case detailBook
//    case detailClip
//    
//    // registerBook
//    case searchBook
//    case addBook
//    case addDough
//    case completeAddingBook
//    
//    // registerPhrase
//    case addPhrase
//    case addThoughts
//    case addClipToPhrase
//    case completeAddingPhrase
//    
//    // registerClip
//    case addClip
//    case editClip
//    
//    // recipt
//    case recipt
//    case reciptPossible
//    case reciptImpossible
//    
//    case selectBookRanking
//    case selectPhraseRanking
//    case issueRecipt
//    
//    // setting
//    case setting
//    case manual
//    case teamInfo
}
