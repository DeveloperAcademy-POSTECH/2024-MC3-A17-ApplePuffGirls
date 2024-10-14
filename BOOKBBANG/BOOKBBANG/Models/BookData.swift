//
//  BookData.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/8/24.
//

import SwiftUI

final class BookData: ObservableObject {
    @Published var title: String
    @Published var authors: String
    @Published var thumbnail: String
    
    @Published var publishedDate: Date
    @Published var publisher: String
    
    @Published var genre: String
    @Published var readStatus: String? = nil
    @Published var readDate: Date = Date()
    @Published var registerDate: Date
    
    @Published var bread: Int
    
    init(title: String = "", authors: String = "", thumbnail: String = "", publishedDate: Date = Date(), publisher: String = "", genre: String = "", readStatus: String? = nil, readDate: Date = Date(), registerDate: Date = Date(), bread: Int = 0) {
        self.title = title
        self.authors = authors
        self.thumbnail = thumbnail
        self.publishedDate = publishedDate
        self.publisher = publisher
        self.genre = genre
        self.readStatus = readStatus
        self.readDate = readDate
        self.registerDate = registerDate
        self.bread = bread
    }
}

final class PhraseData: ObservableObject {
    @Published var content: String
    @Published var thought: String
    @Published var book: Book?
    @Published var createdDate: Date
    
    init(content: String = "", thought: String = "", book: Book? = nil, createdDate: Date = Date()) {
        self.content = content
        self.thought = thought
        self.book = book
        self.createdDate = createdDate
    }
}
