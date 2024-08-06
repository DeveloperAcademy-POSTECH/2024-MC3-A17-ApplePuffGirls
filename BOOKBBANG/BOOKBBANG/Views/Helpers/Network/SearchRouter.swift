//
//  SearchRouter.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import SwiftUI

class SearchRouter: ObservableObject {
    @Published var book = BookDTO()
    @Published var bookList: [Documents]? = nil
    @Published var currentPage: Int = 1
    var apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
    
    func fetch(searchText: String) {
        guard let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(searchText)&target=title&page=\(currentPage)&size=30")
        else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let book = try JSONDecoder().decode(BookDTO.self, from: data)
                DispatchQueue.main.async {
                    self?.book = book
                    self?.bookList = book.documents
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchMore(searchText: String) {
        if let meta = book.meta {
            if meta.is_end {
                print("페이징 처리 끝")
            }
            else {
                currentPage += 1
                guard let url = URL(string: "https://dapi.kakao.com/v3/search/book?query=\(searchText)&target=title&page=\(currentPage)&size=20")
                else { return }
                
                var request = URLRequest(url: url)
                request.setValue(apiKey, forHTTPHeaderField: "Authorization")
                
                let task = URLSession.shared.dataTask(with: request) { [weak self] data,
                    _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    
                    do {
                        let book = try JSONDecoder().decode(BookDTO.self, from: data)
                        DispatchQueue.main.async {
                            self?.book = book
                            if let documents = book.documents {
                                self?.bookList?.append(contentsOf: documents)
                            }
                            print(book)
                        }
                    }
                    catch {
                        print(error)
                    }
                }
                task.resume()
            }
        }
    }
}

