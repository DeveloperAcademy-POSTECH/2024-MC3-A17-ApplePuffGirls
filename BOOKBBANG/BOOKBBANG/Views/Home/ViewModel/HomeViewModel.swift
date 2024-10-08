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
    // 임시객체
    @Published var selectedBookData: BookData? = nil
    // CoreData 연결 객체
    @Published var selectedBook: Book? = nil
    @Published var selectedClip: Clip? = nil
    
    func transition(to: HomeViewType) {
        DispatchQueue.main.async {
            self.viewStatus = to
        }
    }
    
    func selectBookData(_ book: BookData) {
        self.selectedBookData = book
        print("selectedBook: \(String(describing: selectedBookData))")
    }
    
    func selectBook(_ book: Book) {
        self.selectedBook = book
        print("selectedBook: \(String(describing: selectedBook))")
    }
}

enum HomeViewType {
    case home
    
    case searchBook
    case addBook
    case addBookFinal
    
    case detailBook
    
    case receipt
    case setting
    
    case detailClip
}
