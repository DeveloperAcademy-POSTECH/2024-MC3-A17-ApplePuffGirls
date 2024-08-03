//
//  PersistentController.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/3/24.
//

import Foundation
import CoreData

struct PersistentController {
    static let shared = PersistentController()
    
    // preview에 쓰이는 container
    static var preview: PersistentController = {
        let result = PersistentController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Book(context: viewContext)
            newItem.publishedDate = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
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

//MARK: - Core Data with Book Model

extension PersistentController {
    func saveBook(author: String,
                  thumbnail: String,
                  title: String,
                  publisher: String,
                  publishedDate: Date,
                  readStatus: Int16,
                  readDate: Date) throws {
        let book = Book(context: container.viewContext)
        
        book.author = author
        book.thumbnail = thumbnail
        book.name = title
        book.publisher = publisher
        book.publishedDate = publishedDate
        book.readStatus = readStatus
        book.readDate = readDate
        
        do {
            try container.viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
    }
    
    func deleteBook(book: Book) {
        do {
            container.viewContext.delete(book)
            try container.viewContext.save()
        } catch {
            fatalError("Failed to delete book, \(error.localizedDescription)")
        }
    }
}

//MARK: - Core Data with Phrase Model

extension PersistentController {
    func savePhrase(content: String, thinking: String, createdDate: Date) {
        let phrase = Phrase(context: container.viewContext)
        
        phrase.content = content
        phrase.thinking = thinking
        phrase.createdDate = createdDate
        
        do {
            try self.container.viewContext.save()
        } catch {
            print("Failed to save, \(error.localizedDescription)")
        }
    }
    
    func deletePhrase(phrase: Phrase) {
        do {
            container.viewContext.delete(phrase)
            try container.viewContext.save()
        } catch {
            fatalError("Failed to delete phrase, \(error.localizedDescription)")
        }
    }
}

//MARK: - Core Data with Clip Model

extension PersistentController {
    func saveClip(title: String,
                  description: String,
                  color: Int16,
                  design: Int16) {
        let clip = Clip(context: container.viewContext)
        
        clip.title = title
        clip.clipDescription = description
        clip.color = color
        clip.design = design
        
        do {
            try self.container.viewContext.save()
        } catch {
            print("Failed to save, \(error.localizedDescription)")
        }
    }
    
    func deleteClip(clip: Clip) {
        do {
            container.viewContext.delete(clip)
            try container.viewContext.save()
        } catch {
            fatalError("Failed to delete clip, \(error.localizedDescription)")
        }
    }
}

enum CoreDataError: Error {
    case failedToGetURL
}

