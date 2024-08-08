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
                ClipTextFields(clipData: clipData)
                
                ClipShapeButton(clipData: clipData)
                    .padding(.vertical, 5)
                
                ClipColorButton(clipData: clipData)
                
                Spacer()
            }
        }
        .background(.backLighter)
    }
    
    private func saveClip() {
        withAnimation {
            if let color = clipData.selectedColor, let shape = clipData.selectedShape {
                clip.color = Int16(color)
                clip.design = Int16(shape)
                clip.title = clipData.name
                clip.clipDescription = clipData.description
            }
            
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
