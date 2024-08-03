//
//  SearchTestView.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/3/24.
//

import SwiftUI
import CoreData

struct SearchTestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.publishedDate, ascending: true)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    var body: some View {
        ForEach(books) { book in
            if let name = book.name {
                Text(name)
            }
        }
    }
}

#Preview {
    SearchTestView().environment(\.managedObjectContext, PersistentController.preview.container.viewContext)
}
