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
    // 임시 객체
    @Published var selectedBookData: BookData? = nil
    // CoreData 연결 객체
    @Published var selectedBook: Book? = nil
    @Published var selectedClip: Clip? = nil
    
    @Published var progress: Int = 1
    
    func transition(to: HomeViewType) {
        DispatchQueue.main.async {
            self.viewStatus = to
        }
    }
    
    func selectBookData(_ book: BookData) {
        self.selectedBookData = book
    }
    
    func selectBook(_ book: Book) {
        self.selectedBook = book
    }
    
    func nextProgress() {
        if progress < 3 {
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

enum HomeViewType {
    case home
    
    case searchBook
    case addBook
    case addBookFinal
    
    case detailBook
    
    case detailClip
}
