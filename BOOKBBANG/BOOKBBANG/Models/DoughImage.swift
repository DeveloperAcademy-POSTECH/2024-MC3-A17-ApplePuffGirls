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
      return "Dough_6"
    case .sikpang:
      return "Dough_2"
    case .bagel:
      return "Dough_3"
    case .twistbread:
      return "Dough_4"
    case .baguette:
      return "Dough_1"
    case .sorapang:
      return "Dough_7"
    case .sweetbread:
      return "Dough_8"
    case .pretzel:
      return "Dough_5"
    }
  }
  
  static let allDoughCount: Int = 8
}

enum BreadImage: String, CaseIterable {
    case croissant, sikpang, bagel, twistbread
    case baguette, sorapang, sweetbread, pretzel
    
    var imageName: String {
      switch self {
      case .croissant:
        return "Bread_6"
      case .sikpang:
        return "Bread_2"
      case .bagel:
        return "Bread_3"
      case .twistbread:
        return "Bread_4"
      case .baguette:
        return "Bread_1"
      case .sorapang:
        return "Bread_7"
      case .sweetbread:
        return "Bread_8"
      case .pretzel:
        return "Bread_5"
      }
    }
    
    static let allBreadCount: Int = 8
}
