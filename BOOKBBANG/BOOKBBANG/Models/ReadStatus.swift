//
//  ReadStatus.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import Foundation

enum ReadStatus: String, CaseIterable {
    case readYet = "읽기 전"
    case readIng = "읽는 중"
    case readFinished = "읽기 완료"
  
   static let allStatusCount: Int = 3
}
