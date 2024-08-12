//
//  AddPhraseScanner.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/12/24.
//

import SwiftUI
import PhotosUI

struct AddPhraseScanner: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var liveTextViewModel: LiveTextViewModel
    
    var body: some View {
        switch liveTextViewModel.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case .scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case .cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case .notDetermined:
            Text("Requesting camera access")
        }
    }
    
    private var mainView: some View {
        VStack {
            CustomNavigationBar(isHighlighted: .constant(false),
                                navigationType: .chevron, 
                                title: "문장 추가하기",
                                onChevron: { dismiss() })
            liveImageFeed
                .background { Color.gray.opacity(0.3) }
                .ignoresSafeArea()
                .id(liveTextViewModel.dataScannerViewId)
                .overlay(alignment: .bottom) {
                    bottomContainerView
                        .background(.ultraThinMaterial)
                        .presentationDetents([.medium, .fraction(0.25)])
                        .presentationDragIndicator(.visible)
                        .interactiveDismissDisabled()
                        .disabled(liveTextViewModel.capturedPhoto != nil)
                        .onAppear {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                  let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                                return
                            }
                            controller.view.backgroundColor = .clear
                        }
                }
                .sheet(item: $liveTextViewModel.capturedPhoto) { photo in
                    VStack {
                        CustomNavigationBar(isHighlighted: .constant(true),
                                            navigationType: .cancel,
                                            title: "문장 추가하기",
                                            rightTitle: "완료",
                                            onCancel: { clickRightButton() },
                                            onRightButton: { clickRightButton() })
                        
                        LiveTextView(image: photo.image)
                    }
                    .background(.backLighter)
                    .edgesIgnoringSafeArea(.bottom)
                }
                .onChange(of: liveTextViewModel.scanType) { _ in liveTextViewModel.recognizedItems = [] }
                .onChange(of: liveTextViewModel.textContentType) { _ in liveTextViewModel.recognizedItems = [] }
                .onChange(of: liveTextViewModel.recognizesMultipleItems) { _ in liveTextViewModel.recognizedItems = []}
                .onChange(of: liveTextViewModel.selectedPhotoPickerItem) { newValue in
                    guard let newValue = newValue else { return }
                    Task { @MainActor in
                        guard let data = try? await newValue.loadTransferable(type: Data.self),
                              let image = UIImage(data: data)
                        else { return }
                        self.liveTextViewModel.capturedPhoto = .init(image: image)
                    }
                }
        }
        .background(.backLighter)
        .navigationBarBackButtonHidden()
    }
    
    private func clickRightButton() {
        liveTextViewModel.capturedPhoto = nil
        dismiss()
    }
    
    @ViewBuilder
    private var liveImageFeed: some View {
        if let capturedPhoto = liveTextViewModel.capturedPhoto {
            Image(uiImage: capturedPhoto.image)
                .resizable()
                .scaledToFit()
        } else {
            DataScanner(
                shouldCapturePhoto: $liveTextViewModel.shouldCapturePhoto,
                capturedPhoto: $liveTextViewModel.capturedPhoto,
                recognizedItems: $liveTextViewModel.recognizedItems,
                recognizedDataType: liveTextViewModel.recognizedDataType,
                recognizesMultipleItems: liveTextViewModel.recognizesMultipleItems)
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack {
                VStack {
                    PhotosPicker(selection: $liveTextViewModel.selectedPhotoPickerItem, matching: .images) {
                        Image(systemName: "photo.circle")
                            .imageScale(.large)
                            .font(.system(size: 32))
                    }
                    
                    Text("갤러리")
                }
                
                VStack {
                    Button {
                        liveTextViewModel.shouldCapturePhoto = true
                    } label: {
                        Image(systemName: "camera.circle")
                            .imageScale(.large)
                            .font(.system(size: 32))
                    }
                    
                    Text("카메라")
                }
            }
            
        }.padding(.horizontal)
    }
    
    private var bottomContainerView: some View {
        HStack {
            Spacer()
            headerView
                .padding()
            Spacer()
        }
        .background{ Color.gray.opacity(0.3) }
    }
}
