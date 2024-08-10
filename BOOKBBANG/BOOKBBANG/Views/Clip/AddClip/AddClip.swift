//
//  AddClip.swift
//  BOOKBBANG
//
//  Created by 이연정 on 7/30/24.
//

import SwiftUI

struct AddClip: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var clipData = ClipData()
    private let nameLimit = 13
    private let descriptionLimit = 25
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .cancel,
                                title: "새로운 클립 추가하기",
                                rightTitle: "저장",
                                onCancel: { dismiss() },
                                onRightButton: { saveClip() })
            //.padding(.top, 20)
            
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
            let newClip = Clip(context: viewContext)
            
            newClip.color = Int16(clipData.selectedColor)
            newClip.design = Int16(clipData.selectedShape)
            newClip.title = clipData.name
            newClip.clipDescription = clipData.description
            newClip.createdDate = Date()
            
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
