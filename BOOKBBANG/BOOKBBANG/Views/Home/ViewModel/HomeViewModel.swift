//
//  HomeViewModel.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/4/24.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    @Published var viewStatus: HomeViewType = .home
    @Published var selectedBook: Book? = nil
    
    func transition(to: HomeViewType) {
        DispatchQueue.main.async {
            withAnimation(.spring(duration: 0.2, bounce: 0.3)) {
                self.viewStatus = to
            }
        }
    }
}

enum HomeViewType {
    case home
    
    case searchBook
    case detailBook
    
    case receipt
    case setting
}
