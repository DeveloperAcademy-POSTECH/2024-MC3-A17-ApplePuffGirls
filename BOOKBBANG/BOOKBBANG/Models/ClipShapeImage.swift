//
//  ClipShapeImage.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/4/24.
//

import Foundation
import SwiftUI

enum ClipShapeImage: String, CaseIterable {
  case WaterDropShape, TwinkleShape, SunShape, StarShape
  case AppleShape, FlowerShape, HeartShape, CloverShape
  
  var imageName: String {
    switch self {
    case .WaterDropShape:
      return "WaterDropShape"
    case .TwinkleShape:
      return "TwinkleShape"
    case .SunShape:
      return "SunShape"
    case .StarShape:
      return "StarShape"
    case .AppleShape:
      return "AppleShape"
    case .FlowerShape:
      return "FlowerShape"
    case .HeartShape:
      return "HeartShape"
    case .CloverShape:
      return "CloverShape"
    }
  }
  
  static let allClipShapeCount: Int = 8
}
