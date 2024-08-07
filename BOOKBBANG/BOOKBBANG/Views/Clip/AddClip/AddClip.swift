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
    var navigationTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(isHighlighted: .constant(true),
                                navigationType: .cancel,
                                title: navigationTitle,
                                rightTitle: "저장", onRightButton: { saveClip() })
            
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
            
            if let color = clipData.selectedColor, let shape = clipData.selectedShape {
                newClip.color = Int16(color)
                newClip.design = Int16(shape)
                newClip.title = clipData.name
                newClip.clipDescription = clipData.description
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



#Preview {
    AddClip(navigationTitle: "새로운 클립 추가")
}
