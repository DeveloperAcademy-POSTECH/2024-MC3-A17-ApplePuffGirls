//
//  MultipleClipSelectList.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/5/24.
//

import SwiftUI

struct MultipleClipSelectList : View {
    var title: String
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                
                Image(imageName)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.listTitle)
                        .foregroundColor(.typo100)
                        .padding(.bottom, 2)
                    
                    Text("빵 8개")
                        .font(.phraseBottom)
                        .foregroundStyle(.typo50)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .frame(width: 27, height: 27)
                    .foregroundColor(isSelected ? .greenMain100 : .typo10)
            }
            .padding()
        }
    }
}

struct MultipleSelectionList: View {
    @Binding var items: [String]
    @Binding var clipImage: [String]
    @Binding var selections: [String]

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(Array(items.enumerated()), id: \.element) { index, item in
                MultipleClipSelectList(
                    title: item,
                    imageName: clipImage[index],
                    isSelected: selections.contains(item),
                    action: {
                        if selections.contains(item) {
                            selections.removeAll(where: { $0 == item })
                        } else {
                            selections.append(item)
                        }
                    }
                )
                if index < items.count - 1 {
                    Divider()
                        .padding(.vertical, 2)
                }
            }
        }
    }
}
