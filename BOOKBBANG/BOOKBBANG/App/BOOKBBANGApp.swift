//
//  BOOKBBANGApp.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI

@main
struct BOOKBBANGApp: App {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    let persistenceController = PersistentenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Root()
                .fullScreenCover(isPresented: $isFirstLaunching, content: {
                    Onboarding()
                })
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
