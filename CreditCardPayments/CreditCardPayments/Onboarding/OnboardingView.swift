//
//  OnboardingView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 15/06/22.
//

import SwiftUI
import UIKit

struct OnboardingView: View {
    var body: some View {
        PageView(pages: [
            Page(imageName: "1.Intro"),
            Page(imageName: "2.Intro"),
            Page(imageName: "3.Intro"),
            Page(imageName: "4.Intro")
        ])
        
        
//        control.addTarget(
//                    context.coordinator,
//                    action: #selector(Coordinator.updateCurrentPage(sender:)),
//                    for: .valueChanged)
        
//        PageViewController(pages: [
//            PageView(imageName: "1.Intro"),
//            PageView(imageName: "2.Intro"),
//            PageView(imageName: "3.Intro"),
//            PageView(imageName: "4.Intro")
//        ],
//        currentPage: 0
//        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
