//
//  SettingCategory.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import SwiftUI

enum SettingCategory: CaseIterable {
    case manual
    case teamInfo
    case contact
    
    var title: String {
        switch self {
        case .manual: return "책빵 사용설명서"
        case .teamInfo: return "책빵을 만든 사람들"
        case .contact: return "책빵 문의"
        }
    }
    
    var image: Image {
        switch self {
        case .manual: return Image(.blueCat)
        case .teamInfo: return Image(.brownCat)
        case .contact: return Image(.blueCat)
        }
    }
    
    var destination: AnyView {
        switch self {
        case .manual: return AnyView(Manual())
        case .teamInfo: return AnyView(TeamInfo())
        case .contact: return AnyView(TeamInfo())
        }
    }
}
