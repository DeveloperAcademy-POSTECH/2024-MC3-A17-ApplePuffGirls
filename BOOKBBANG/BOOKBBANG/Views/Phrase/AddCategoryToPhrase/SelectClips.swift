//
//  SelectClips.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/9/24.
//

import SwiftUI

struct SelectClips: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>

    @Binding var selections: [Clip]

    func isSelected(clip: Clip) -> Bool {
        return selections.contains(clip)
    }

    var body: some View {
        ScrollView {
            ForEach(clips) { clip in
                Button {
                    if selections.contains(clip) {
                        selections.removeAll(where: { $0 == clip })
                    } else {
                        selections.append(clip)
                    }
                } label: {
                    VStack(spacing: 0) {
                        HStack {
                            // 클립 이미지
                            Image(ClipItem.allCases[Int(clip.design)].clipImageName)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Colors.allCases[Int(clip.color)].color)
                                .frame(height: 55)
                                .padding(.bottom, 14)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(clip.title ?? "")
                                    .font(.listTitle)
                                    .foregroundColor(.typo100)
                                    .padding(.bottom, 2)
                                
                                Text("빵 \(clip.phrases?.count ?? 325)개")
                                    .font(.phraseBottom)
                                    .foregroundStyle(.typo50)
                            }
                            .padding(.leading, 15)
                            
                            Spacer()
                            
                            Image(systemName: isSelected(clip: clip) ? "checkmark.circle.fill" : "checkmark.circle")
                                .resizable()
                                .frame(width: 27, height: 27)
                                .foregroundColor(isSelected(clip: clip) ? .greenMain100 : .typo10)
                        }
                        .padding()
                        Divider()
                            .padding(.vertical, 2)
                    }
                }
            }
            NewClipButton()
        }
    }
}
