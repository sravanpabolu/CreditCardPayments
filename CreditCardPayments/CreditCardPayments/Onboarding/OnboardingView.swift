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
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
