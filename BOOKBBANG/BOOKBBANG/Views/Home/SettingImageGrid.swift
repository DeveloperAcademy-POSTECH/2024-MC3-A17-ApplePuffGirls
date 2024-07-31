//
//  Settings.swift
//  BOOKBBANG
//
//  Created by Jerrie on 7/31/24.
//

import Foundation
import SwiftUI

struct SettingImageGrid {
    var columnsInPortrait: Double
    var columnsInLandscape: Double
    var spacing: Double
    var padding: EdgeInsets
    var scrollDirection: Axis
    var showsIndicators: Bool
    var animation: Animation?
    var animationSpeed: Double
    
    var columns: Double {
        #if os(OSX) || os(tvOS) || targetEnvironment(macCatalyst) || os(visionOS)
        return columnsInLandscape
        #else
        return columnsInPortrait
        #endif
    }
    
    var animationEnabled: Bool {
        animation != nil
    }
    
    static func `default`(scrollDirection: Axis = .vertical) -> SettingImageGrid {
            return SettingImageGrid(
                columnsInPortrait: 3,
                columnsInLandscape: 4,
                spacing: 12,
                padding: .init(),
                scrollDirection: scrollDirection,
                showsIndicators: true,
                animation: .default,
                animationSpeed: 1
            )
    }
}
