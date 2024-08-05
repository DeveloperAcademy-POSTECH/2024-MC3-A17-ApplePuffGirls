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
    @Published var selectedShape: Int? = 0
    @Published var selectedColor: Int? = 0

    init(name: String = "", description: String = "", selectedShape: Int? = nil, selectedColor: Int? = nil) {
        self.name = name
        self.description = description
        self.selectedShape = selectedShape
        self.selectedColor = selectedColor
    }
}
