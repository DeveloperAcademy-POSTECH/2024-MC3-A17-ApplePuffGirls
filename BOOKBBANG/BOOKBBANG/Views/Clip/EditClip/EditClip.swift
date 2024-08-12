//
//  EditClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct EditClip: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var clip: Clip
    @ObservedObject var clipData = ClipData()
    
    @State private var checkEmpty: Bool = false
    
    private let nameLimit = 13
    private let descriptionLimit = 25
    
    // 처음에 clipData 객체에 core Data의 객체를 옮김. -> 저장할 때 다시 core Data에 덮어씌움.
    init(clip: Clip) {
        self.clip = clip
        
        clipData.name = clip.title ?? ""
        clipData.description = clip.clipDescription ?? ""
        clipData.selectedShape = Int(clip.design)
        clipData.selectedColor = Int(clip.color)
    }
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .cancel,
                                title: "클립 수정하기",
                                rightTitle: "저장",
                                onCancel: { dismiss() },
                                onRightButton: { saveClip() })
            
            TopClipImage(clipData: clipData)
            
            VStack(alignment: .leading) {
                ClipTextFields(clipData: clipData, checkEmpty: $checkEmpty)
                
                ClipShapeButton(clipData: clipData)
                    .padding(.vertical, 5)
                
                ClipColorButton(clipData: clipData)
                
                Spacer()
            }
        }
        .background(.backLighter)
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    private func saveClip() {
        withAnimation {
            clip.color = Int16(clipData.selectedColor)
            clip.design = Int16(clipData.selectedShape)
            clip.title = clipData.name
            clip.clipDescription = clipData.description
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            dismiss()
        }
    }
}
