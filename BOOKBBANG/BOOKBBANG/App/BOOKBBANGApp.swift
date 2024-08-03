//
//  BOOKBBANGApp.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 7/30/24.
//

import SwiftUI

@main
struct BOOKBBANGApp: App {
    let persistenceController = PersistentController.shared
    
    var body: some Scene {
        WindowGroup {
            SearchTestView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
