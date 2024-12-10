//
//  SettingViewModel.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/4/24.
//

import Foundation
import SwiftUI

final class SettingViewModel: ObservableObject {
    @Published var viewStatus: SettingViewType = .setting
    
    func transition(to: SettingViewType) {
        DispatchQueue.main.async {
            withAnimation(.spring(duration: 0.2, bounce: 0.3)) {
                self.viewStatus = to
            }
        }
    }
    
    func selectCategory(_ category: SettingCategory) {
        switch category {
        case .manual:
            viewStatus = .manual
        case .teamInfo:
            viewStatus = .teamInfo
        case .contact:
            viewStatus = .teamInfo
        }
    }
}

enum SettingViewType {
    case setting
    
    case manual
    case teamInfo
    case contact
}
