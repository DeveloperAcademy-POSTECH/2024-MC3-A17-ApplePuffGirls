//
//  UIApplication+.swift
//  BOOKBBANG
//
//  Created by Seoyeon Choi on 8/9/24.
//

import SwiftUI

extension UIApplication {
    func hideKeyboard() {
        if let windowScene = UIApplication.shared.keyWindowScene {
            if let window = windowScene.windows.first {
                let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
                tapRecognizer.cancelsTouchesInView = false
                tapRecognizer.delegate = self
                window.addGestureRecognizer(tapRecognizer)
            }
        }
    }
}

extension UIApplication: @retroactive UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    var keyWindowScene: UIWindowScene? {
        connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    }
}
