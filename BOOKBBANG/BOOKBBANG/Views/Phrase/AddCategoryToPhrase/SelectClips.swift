//
//  SelectClips.swift
//  BOOKBBANG
//
//  Created by Jerrie on 8/9/24.
//

import SwiftUI

enum DisplaySelectClips {
    case addPhrase, editClip
}

struct SelectClips: View {
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    @Binding var selections: [Clip]
    var display: DisplaySelectClips = .addPhrase
    
    func isSelected(clip: Clip) -> Bool {
        return selections.contains(clip)
    }
    
    var body: some View {
        VStack {
            if display == .editClip {
                CustomNavigationBar(isHighlighted: .constant(false),
                                    navigationType: .chevron,
                                    title: "빵 클립",
                                    onChevron: { dismiss() })
            }
            
            ScrollView() {
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
                                // Jerrie Comment : 클립 이미지 불러오는 거 이렇게 하는 게 최선일까요
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
            .scrollIndicators(.hidden)
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
    }
}
