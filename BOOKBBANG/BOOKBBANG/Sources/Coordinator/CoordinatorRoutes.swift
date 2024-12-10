//
//  CoordinatorRoutes.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 12/6/24.
//

import Foundation

enum BookbbangRoute: Hashable {
    case createBook
    case bookDetail
    case clipDetail
    
    case receipt
    case setting
}

enum BookbbangSheet: Hashable, Identifiable {
    var id: String {
        switch self {
        case .createClip: return "createClip"
        }
    }
    
    case createClip
}

enum BookbbangFullScreenOver: Hashable, Identifiable {
    var id: String {
        switch self {
        case .dummy: return "dummy"
        }
    }
    
    case dummy
}
