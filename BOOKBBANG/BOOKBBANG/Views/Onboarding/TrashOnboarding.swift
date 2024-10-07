//
//  TrashOnboarding.swift
//  BOOKBBANG
//
//  Created by 강다혜 on 7/30/24.
//

import SwiftUI

struct TrashOnboarding: View {
    @Binding var isFirstLaunching: Bool
    @AppStorage("installedDate") var installDate: Double?
    
    var body: some View {
        Manual()
        .onAppear {
            installDate = Date().timeIntervalSince1970
        }
    }
}
