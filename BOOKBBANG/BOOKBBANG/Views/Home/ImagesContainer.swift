//
//  Copyright © 2019 Paolo Leonardi.
//
//  Licensed under the MIT license. See the LICENSE file for more info.
//

import SwiftUI
import CoreData

struct ImagesContainer: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.registerDate, ascending: false)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    @State private var images: [String] = []
    @State private var settings = SettingImageGrid.default()
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: SearchBook()) {
                Rectangle()
                    .frame(width: 106, height: 155)
                    .foregroundStyle(.typo25)
                    .clipShape(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .light))
                    }
            }
            
            ImagesGrid(images: $images, settings: $settings)
                .onAppear {
                    updateImages()
                }
                .onReceive(books.publisher) { _ in
                    updateImages()
                }
        }
    }
    
    private func updateImages() {
        images = books.compactMap { $0.thumbnail }
    }
}

struct ImagesContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImagesContainer()
    }
}
