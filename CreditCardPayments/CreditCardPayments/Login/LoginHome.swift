//
//  LoginHome.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 17/06/22.
//

import SwiftUI

enum LoginType {
    case login, register
}

struct LoginHome: View {

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.registerScreenBGColor)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor(Color.buttonBGColor)],
            for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor(Color.buttonBGColor)],
            for: .normal)
    }

    @State private var defaultSelection: LoginType = .login

    var body: some View {
        ZStack {
            Color.registerScreenBGColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 10)

                logoView

                Spacer()
                    .frame(height: 20)

                segmentControlView

                if self.defaultSelection == .login {
                    LoginView()
                } else {
                    RegisterView()
                }

                Spacer()
            }
        }
    }

    var logoView: some View {
        Text("Cards")
            .font(.title)
            .foregroundColor(.buttonBGColor)
    }

    var segmentControlView: some View {
        Picker("", selection: $defaultSelection) {
            Text(Constants.login)
                .tag(LoginType.login)
                .font(.titleFont)
                .foregroundColor(Color.titleColor)

            Text(Constants.register)
                .tag(LoginType.register)

            Spacer()
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

struct LoginHome_Previews: PreviewProvider {
    static var previews: some View {
        LoginHome()
    }
}
