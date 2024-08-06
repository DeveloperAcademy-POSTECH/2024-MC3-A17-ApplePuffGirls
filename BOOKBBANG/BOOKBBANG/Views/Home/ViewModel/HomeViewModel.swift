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
            self.viewStatus = to
        }
    }
    
    func selectBook(_ book: Book) {
        self.selectedBook = book
    }
}

enum HomeViewType {
    case home
    
    case searchBook
    case addBook
    case addDough
    case addBookFinal
    
    case detailBook
    
    case receipt
    case setting
}
