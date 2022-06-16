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
        VStack {
            CustomTextField(title: Constants.mpin, iconName: "lock", value: $ssn)
            
            CustomButton(title: Constants.btn_submit) {
                print("Submit tapped")
            }
        }
        .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
        .background(Color.registerScreenBGColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
