//
//  ClipImage.swift
//  BOOKBBANG
//
//  Created by 이연정 on 8/4/24.
//

import Foundation
import SwiftUI

enum ClipImage: String, CaseIterable {
  case WaterDropClip, TwinkleClip, SunClip, StarClip
  case AppleClip, FlowerClip, HeartClip, CloverClip
  
  var imageName: String {
    switch self {
    case .WaterDropClip:
      return "WaterDropClip"
    case .TwinkleClip:
      return "TwinkleClip"
    case .SunClip:
      return "SunClip"
    case .StarClip:
      return "StarClip"
    case .AppleClip:
      return "AppleClip"
    case .FlowerClip:
      return "FlowerClip"
    case .HeartClip:
      return "HeartClip"
    case .CloverClip:
      return "CloverClip"
    }
  }
  
  static let allClipCount: Int = 8
}

