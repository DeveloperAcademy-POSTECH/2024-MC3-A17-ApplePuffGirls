//
//  ClipData.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

class ClipData: ObservableObject {
    @Published var name: String
    @Published var description: String
    @Published var selectedShape: Int
    @Published var selectedColor: Int

    init(name: String = "", description: String = "", selectedShape: Int = 0, selectedColor: Int = 0) {
        self.name = name
        self.description = description
        self.selectedShape = selectedShape
        self.selectedColor = selectedColor
    }
}
