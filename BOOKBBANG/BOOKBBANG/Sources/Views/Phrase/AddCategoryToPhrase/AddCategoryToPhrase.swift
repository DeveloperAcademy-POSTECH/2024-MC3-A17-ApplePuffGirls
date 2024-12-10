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
        
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Clip.title, ascending: true)], animation: .default)
    private var clips: FetchedResults<Clip>
    
    @State var selections: [Clip] = []
    
    @Binding var phraseData: PhraseData

    func isSelected(clip: Clip) -> Bool {
        return selections.contains(clip)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .chevron,
                                title: "새로운 빵 굽기",
                                rightTitle: "다음",
                                onChevron: { clickBackButton() },
                                onRightButton: { clickNextButton() })
            
            CustomProgressBar(process: $detailBookViewModel.progress, count: 4)
            
            VStack(alignment: .leading, spacing: 0) {
                Section {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundStyle(.greenSub50)
                            .frame(height: 14)
                            .padding(.bottom, -5)
                        
                        if let title = phraseData.book?.name {
                            Text("\"\(title)\"")
                                .foregroundStyle(.typo100)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.bottom, 3)
                                .frame(maxWidth: UIScreen.main.bounds.width - 46)
                                .lineLimit(1)
                        }
                    }
                    .fixedSize()
                    
                    Text("빵을 어떤 클립에 담아둘까요?")
                        .foregroundStyle(.typo100)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 4)
                    
                    Text("빵에 어울리는 클립을 선택해보세요 (복수 선택 가능)")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.bottom, 35)
                        .lineSpacing(5)
                }
                
                Divider()
                    .padding(.bottom, 24)
                
                SelectClips(selections: $selections)

            }
            .padding(.horizontal, 22)
            .padding(.top, 20)
            
            
            Spacer()
        }
        .background(.backLighter)
    }
    
    private func clickBackButton() {
        detailBookViewModel.backProgress()
        detailBookViewModel.transition(to: .addThoughts)
    }
    
    private func clickNextButton() {
        let newPhrase = Phrase(context: viewContext)
        newPhrase.content = detailBookViewModel.newPhraseData?.content
        newPhrase.thinking = detailBookViewModel.newPhraseData?.thought
        newPhrase.book = detailBookViewModel.newPhraseData?.book
        newPhrase.createdDate = detailBookViewModel.newPhraseData?.createdDate
        newPhrase.clips = NSSet(array: selections)
        newPhrase.book?.phraseCount += 1
        
        detailBookViewModel.nextProgress()
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
