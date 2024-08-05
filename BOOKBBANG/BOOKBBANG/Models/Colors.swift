//
//  Colors.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/5/24.
//

import Foundation
import SwiftUI

enum Colors: String, CaseIterable {
  case cred, cyellow, corange, cgreen
  case cblue, cpurple, cpink, csky
  
  var color: Color {
         switch self {
         case .cred:
             return Color.clipRed
         case .cyellow:
             return Color.clipYellow
         case .corange:
             return Color.clipOrange
         case .cgreen:
             return Color.clipGreen
         case .cblue:
             return Color.clipBlue
         case .cpurple:
             return Color.clipPurple
         case .cpink:
             return Color.clipPink
         case .csky:
             return Color.clipSky
         }
     }
  
  static let allColorsCount: Int = 8
}

