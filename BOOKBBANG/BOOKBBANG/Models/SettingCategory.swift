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
    case widget
    case alert
    
    var title: String {
        switch self {
        case .manual: return "책빵 사용설명서"
        case .teamInfo: return "Apple Puff Girls에 대해"
        case .widget: return "위젯 설정"
        case .alert: return "알림 설정"
        }
    }
    
    var image: Image {
        switch self {
        case .manual: return Image(.oven)
        case .teamInfo: return Image(.teamLogo)
        case .widget: return Image(.fish2)
        case .alert: return Image(.fish4)
        }
    }
    
    var destination: AnyView {
        switch self {
        case .manual: return AnyView(Manual(isFirstLaunching: .constant(true)))
        case .teamInfo: return AnyView(TeamInfo())
        case .widget: return AnyView(Text("widget"))
        case .alert: return AnyView(Text("alert"))
        }
    }
}
