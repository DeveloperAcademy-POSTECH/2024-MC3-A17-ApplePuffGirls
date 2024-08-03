//
//  ClipStyle.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI

enum ClipStyle: Int {
    case apple, clover, flower, heart
    case star, sun, twinkle, waterDrop
}

enum ClipColor: Int {
    case red, orange, yellow, green
    case sky, blue, pink, purple

    var color: Color {
        switch self {
        case .red:
            return .clipRed
        case .orange:
            return .clipOrange
        case .yellow:
            return .clipYellow
        case .green:
            return .clipGreen
        case .sky:
            return .clipSky
        case .blue:
            return .clipBlue
        case .pink:
            return .clipPink
        case .purple:
            return .clipPurple
        }
    }
}
