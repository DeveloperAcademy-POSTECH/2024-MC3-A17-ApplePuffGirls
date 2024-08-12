//
//  Onboarding.swift
//  BOOKBBANG
//
//  Created by 강다혜 on 7/30/24.
//

import SwiftUI

struct Onboarding: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        Manual(isFirstLaunching: $isFirstLaunching, 
               display: .onboarding)
    }
}

#Preview {
    Onboarding(isFirstLaunching: .constant(true))
}
