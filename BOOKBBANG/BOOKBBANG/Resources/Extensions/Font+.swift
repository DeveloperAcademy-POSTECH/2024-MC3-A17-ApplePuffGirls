//
//  Font+.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI

extension Font {
    static let bookk15: Font = .custom("BookkMyungjo-Lt", fixedSize: 15)
    
    static let navigation: Font = .system(size: 18, weight: .semibold)
    static let cancel: Font = .system(size: 17, weight: .regular)
    static let save: Font = .system(size: 17, weight: .bold)
    
    // 구절 카드
    static let phraseTop: Font = .system(size: 16, weight: .bold) // 구절 위의 날짜, 책제목 등 (초록 형광펜)
    static let phraseBottom: Font = .system(size: 12, weight: .regular) // 구절 밑의 책 제목 또는 날짜
    
    // 메인화면 책별/클립별 탭바
    static let segment: Font = .system(size: 16, weight: .regular)
    static let segmentSelected: Font = .system(size: 16, weight: .bold)
    
    // 클립 리스트
    static let listTitle: Font = .system(size: 16, weight: .semibold)
    
    // 책 상세정보
    static let bookTitle: Font = .system(size: 20, weight: .bold)
    static let bookCaption: Font = .system(size: 13, weight: .regular)
    static let bookCaptionBold: Font = .system(size: 13, weight: .bold)
    static let readStateButton: Font = .system(size: 10, weight: .medium)
    
    // Setting
    static let settingCategoryTitle: Font = .system(size: 14, weight: .semibold)
    
    // teamInfo
    static let teamMemberTitle: Font = .system(size: 24, weight: .semibold)
    static let memberName: Font = .system(size: 17, weight: .semibold)
    static let memberComment: Font = .system(size: 12, weight: .regular)
}
