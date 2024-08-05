//
//  ClipStyle.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
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


enum ClipItem: String, CaseIterable {
  case WaterDrop, Twinkle, Sun, Star
  case Apple, Flower, Heart, Clover
  
  var clipImageName: String {
    switch self {
    case .WaterDrop:
      return "WaterDropClip"
    case .Twinkle:
      return "TwinkleClip"
    case .Sun:
      return "SunClip"
    case .Star:
      return "StarClip"
    case .Apple:
      return "AppleClip"
    case .Flower:
      return "FlowerClip"
    case .Heart:
      return "HeartClip"
    case .Clover:
      return "CloverClip"
    }
  }
  
  var shapeImageName: String {
    switch self {
    case .WaterDrop:
      return "WaterDropShape"
    case .Twinkle:
      return "TwinkleShape"
    case .Sun:
      return "SunShape"
    case .Star:
      return "StarShape"
    case .Apple:
      return "AppleShape"
    case .Flower:
      return "FlowerShape"
    case .Heart:
      return "HeartShape"
    case .Clover:
      return "CloverShape"
    }
  }
  
  static let allClipCount: Int = ClipItem.allCases.count
  static let allClipShapeCount: Int = ClipItem.allCases.count
}

