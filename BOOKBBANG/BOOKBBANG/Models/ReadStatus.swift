//
//  ReadStatus.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import Foundation

enum ReadStatus: String {
    case readYet
    case readIng
    case readFinished
    
    var description: String {
        switch self {
        case .readYet: return "읽기 전"
        case .readIng: return "읽는 중"
        case .readFinished: return "읽기 완료"
        }
    }
}
