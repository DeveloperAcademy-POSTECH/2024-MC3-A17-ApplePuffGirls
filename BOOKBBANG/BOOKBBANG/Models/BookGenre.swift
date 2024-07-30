//
//  BookGenre.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import Foundation

enum BookGenre: String {
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
}
