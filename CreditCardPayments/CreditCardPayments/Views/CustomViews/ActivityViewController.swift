//
//  ActivityViewController.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 24/06/22.
//

import UIKit
import SwiftUI

// func shareSheet(url: String) {
//    let url = URL(string: url)
//    let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
//
//    let allScenes = UIApplication.shared.connectedScenes
//    let scene = allScenes.first { $0.activationState == .foregroundActive }
//
//    if let windowScene = scene as? UIWindowScene {
//        windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
//    }
//
// }

// 1. Activity View
struct ActivityView: UIViewControllerRepresentable {
    let text: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: [text], applicationActivities: nil)
    }

    func updateUIViewController(_
                                uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {}
}
