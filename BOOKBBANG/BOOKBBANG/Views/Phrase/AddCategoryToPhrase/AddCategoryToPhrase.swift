//
//  AddCategoryToPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/3/24.
//

import SwiftUI

struct AddCategoryToPhrase: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var detailBookViewModel: DetailBookViewModel
    
    //@Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    @State var selections: [Clip] = []

    func isSelected(clip: Clip) -> Bool {
        return selections.contains(clip)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음",
                                onChevron: { detailBookViewModel.transition(to: .addThoughts) },
                                onRightButton: { clickRightButton() })
            
            AddCategorytoPhraseProgressBar()
            
            Image(.baking3)
                .resizable()
                .scaledToFit()
                .frame(height: 90)
            
            Section {
                Text("빵을 어떤 클립에 담아둘까요?")
                    .foregroundStyle(.typo100)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 10)
                
                Text("빵에 어울리는 클립을 선택해보세요. (복수 선택 가능)")
                    .foregroundStyle(.typo50)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 20)
                    .lineSpacing(5)
            }
            .padding(.horizontal, 22)
            
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
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickRightButton() {
        let newPhrase = Phrase(context: viewContext)
        newPhrase.page = detailBookViewModel.newPhraseData?.page
        newPhrase.content = detailBookViewModel.newPhraseData?.content
        newPhrase.thinking = detailBookViewModel.newPhraseData?.thought
        newPhrase.book = detailBookViewModel.newPhraseData?.book
        newPhrase.createdDate = detailBookViewModel.newPhraseData?.createdDate
        newPhrase.book?.phraseCount += 1
        
        detailBookViewModel.addPhrase(newPhrase)
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        
        detailBookViewModel.transition(to: .addClipFinal)
    }
}

func AddCategorytoPhraseProgressBar() -> some View {
    return VStack {}
        .frame(width: UIScreen.main.bounds.width, height: 2)
        .background(.typo25)
        .overlay(alignment: .leading) {
            VStack{}
                .frame(width: UIScreen.main.bounds.width / 4 * 3 , height: 2)
                .background(.greenMain100)
        }
}

//#Preview {
//    AddCategoryToPhrase()
//}
