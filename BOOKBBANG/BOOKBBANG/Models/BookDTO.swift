//
//  BookDTO.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/1/24.
//

import Foundation

/// DTO
struct Documents: Codable, Hashable {
    var authors: [String]
    var contents: String
    var datetime: String
    var isbn: String
    var price: Int
    var publisher: String
    var sale_price: Int
    var status: String
    var thumbnail: String
    var title: String
    var translators: [String?]
    var url: String
}

struct Meta: Codable {
    var is_end: Bool
    var pageable_count: Int
    var total_count: Int
}

struct BookDTO: Codable {
    var documents: [Documents]?
    var meta: Meta?
}
