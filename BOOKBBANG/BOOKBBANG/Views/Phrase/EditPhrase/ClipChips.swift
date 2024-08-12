////
////  ClipChips.swift
////  BOOKBBANG
////
////  Created by kyunglimkim on 8/6/24.
////
//
//import SwiftUI
//
//public struct ChipsType: Identifiable, Equatable {
//    public let id = UUID()  // Identifiable 프로토콜을 채택하기 위해 필요
//    let cliptitle: String
//    let clippriority: Int
//    let clipimage: String
//
//    public init(
//        cliptitle: String,
//        clippriority: Int = 0,
//        clipimage: String
//    ) {
//        self.cliptitle = cliptitle
//        self.clippriority = clippriority
//        self.clipimage = clipimage
//    }
//
//    public static func == (lhs: ChipsType, rhs: ChipsType) -> Bool {
//        lhs.id == rhs.id
//    }
//}
//
//public struct ChipsView: View {
//    private let cliptitle: String
//    private let clipimage: String
//    
//    public init(cliptitle: String, clipimage: String) {
//        self.cliptitle = cliptitle
//        self.clipimage = clipimage
//    }
//    
//    public var body: some View {
//        HStack {
//            Image(clipimage)
//                .resizable()
//                .frame(width: 25, height: 23)
//            
//            Text(cliptitle)
//                .foregroundStyle(.typo80)
//                .font(.system(size: 12, weight: .regular))
//        }
//    }
//}
//#Preview {
//    ChipsView(cliptitle: "안녕", clipimage: "fish_1")
//}
