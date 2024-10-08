//
//  BookGenre.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import Foundation
import SwiftUI

enum BookGenre: String, CaseIterable {
    case essay, novel, liberalArts, economicManagement
    case religion, socialPolitics, selfImprovement, history, naturalScience
    case etc
    
    var description: String {
        switch self {
        case .essay: return "시/에세이"
        case .novel: return "소설"
        case .liberalArts: return "인문"
        case .economicManagement: return "경제/경영"
        case .religion: return "종교"
        case .socialPolitics: return "사회/정치"
        case .selfImprovement: return "자기계발"
        case .history: return "역사"
        case .naturalScience: return "자연/과학"
        case .etc: return "기타"
        }
    }
    
    var bread: Image {
        switch self {
        case .essay: return Image(.bread1)
        case .novel: return Image(.bread2)
        case .liberalArts: return Image(.bread3)
        case .economicManagement: return Image(.bread4)
        case .religion: return Image(.bread5)
        case .socialPolitics: return Image(.bread6)
        case .selfImprovement: return Image(.bread7)
        case .history: return Image(.bread8)
        case .naturalScience: return Image(.bread9)
        case .etc: return Image(.bread10)
        }
    }
    
    static func fromDescription(_ description: String) -> BookGenre? {
        return BookGenre.allCases.first { $0.description == description }
    }
    
    static let allGenreCount: Int = 10
}
