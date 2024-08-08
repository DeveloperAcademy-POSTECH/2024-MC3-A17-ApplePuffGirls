//
//  countBooksContainingClip.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/8/24.
//

import Foundation
import CoreData

func countPhrasesContainingClip(clip: Clip, context: NSManagedObjectContext) -> Int {
    let fetchRequest: NSFetchRequest<Phrase> = Phrase.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "ANY clips == %@", clip)
    do {
        return try context.count(for: fetchRequest)
    } catch {
        print("Failed to fetch count of books containing clip: \(error)")
        return 0
    }
}

