//
//  PersistenceController.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/6/24.
//

import Foundation
import CoreData

struct PersistentenceController {
    static let shared = PersistentenceController()
    
    let container: NSPersistentCloudKitContainer
    
    private init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "BOOKBBANG")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent store, \(error.localizedDescription)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}

enum CoreDataError: Error {
    case failedToGetURL
}

