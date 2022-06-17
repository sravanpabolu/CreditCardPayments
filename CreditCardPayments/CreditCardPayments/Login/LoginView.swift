//
//  LoginView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

struct LoginView: View {
    @State var ssn: String = ""

    var body: some View {
        Form {
            // This user should come from local
            Text("Hello User")
                .font(.largeTitle)
            CustomTextField(title: Constants.mpin, iconName: "lock", value: $ssn)

            HStack {
                Spacer()
                CustomButton(title: Constants.btnSubmit) {
                    print("Login - Submit tapped")
                }
                Spacer()
            }
        }
        .background(Color.registerScreenBGColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
