//
//  EditPhrase.swift
//  BOOKBBANG
//
//  Created by kyunglimkim on 8/5/24.
//

import SwiftUI

struct EditPhrase: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var phrase: Phrase
    
    @State private var myPhrase: String = ""
    @State private var mythought: String = ""
    @Binding var showEditSheet: Bool
    
    @State var showingAlert: Bool = false
    
    @State var selectedClips: [Clip] = []
    
    init(phrase: Phrase, showEditSheet: Binding<Bool>) {
        _phrase = ObservedObject(wrappedValue: phrase)
        _myPhrase = State(initialValue: phrase.content ?? "")
        _mythought = State(initialValue: phrase.thinking ?? "")
        _showEditSheet = showEditSheet
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                CustomNavigationBar(isHighlighted: .constant(true),
                                    navigationType: .cancel,
                                    title: "빵 수정하기",
                                    rightTitle: "저장",
                                    onCancel: { showEditSheet.toggle() },
                                    onRightButton: { clickRightButton() })
                VStack(alignment: .leading) {
                    editField(title: "내가 구운 빵", text: $myPhrase)
                        .padding(.bottom, 22)
                    
                    Text("빵 클립")
                        .foregroundStyle(.typo50)
                        .font(.system(size: 13, weight: .regular))
                        .padding(.leading, 20)
                    
                    NavigationLink {
                        SelectClips(selections: $selectedClips,
                                    display: .editClip)
                    } label: {
                        ClipsInPhrase(clips: selectedClips)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.typo10))
                            .overlay(alignment: .trailing) {
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 15)
                            }
                    }
                    .padding(.bottom, 20)
                    
                    editField(title: "빵 속에 담긴 나의 생각", text: $mythought)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Spacer()
                        Button(role: .destructive) {
                            showingAlert = true
                        } label: {
                            Text("삭제하기")
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 22)
            }
            .background(Color.backLighter)
        }
        .background(Color.backLighter)
        .onAppear {
            UIApplication.shared.hideKeyboard()
            selectedClips = phrase.clips?.allObjects as? [Clip] ?? []
        }
    }
    
    private func clickRightButton() {
        phrase.content = myPhrase
        phrase.thinking = mythought
        phrase.clips = NSSet(array: selectedClips)
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Failed to save context, \(error.localizedDescription)")
        }
        showEditSheet.toggle()
    }
}

extension EditPhrase {
    private func editField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundStyle(.typo50)
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
                .padding(.leading, 12)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.typo10)
                .overlay(
                    TextEditor(text: text)
                        .scrollContentBackground(.hidden)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.typo80)
                        .lineSpacing(10)
                        .scrollIndicators(.hidden)
                )
        }
    }
}
