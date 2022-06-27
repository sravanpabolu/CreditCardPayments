//
//  AppHome.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 24/06/22.
//

import SwiftUI

struct AppHome: View {
    var isFirstLaunch = true

    init() {
        if let isFirstLaunchData = UserDefaults.standard.data(forKey: Constants.Defaults.isFirstLaunch) {
            let decoder = JSONDecoder()
            if let isFirst = try? decoder.decode(Bool.self, from: isFirstLaunchData) {
                isFirstLaunch = isFirst
            } else {
                isFirstLaunch = true
            }
        } else {
            isFirstLaunch = true
        }
    }

    var body: some View {
        isFirstLaunch ? AnyView(OnboardingView()) : AnyView(LoginHome())
    }
}

struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
    }
}
