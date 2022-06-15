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
        PageViewController(pages: [
            PageView(imageName: "1.Intro"),
            PageView(imageName: "2.Intro"),
            PageView(imageName: "3.Intro"),
            PageView(imageName: "4.Intro")
        ])
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
