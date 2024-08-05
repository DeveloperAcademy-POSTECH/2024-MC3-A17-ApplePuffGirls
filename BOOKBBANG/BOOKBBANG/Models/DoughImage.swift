//
//  DoughImage.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/5/24.
//

import Foundation
import SwiftUI


enum DoughImage: String, CaseIterable {
  case croissant, sikpang, bagel, twistbread
  case baguette, sorapang, sweetbread, pretzel
  
  var imageName: String {
    switch self {
    case .croissant:
      return "Dough_1"
    case .sikpang:
      return "Dough_2"
    case .bagel:
      return "Dough_3"
    case .twistbread:
      return "Dough_4"
    case .baguette:
      return "Dough_5"
    case .sorapang:
      return "Dough_6"
    case .sweetbread:
      return "Dough_7"
    case .pretzel:
      return "Dough_8"
    }
  }
  
  static let allDoughCount: Int = 8
}
