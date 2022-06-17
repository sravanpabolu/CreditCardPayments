//
//  RegisterView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dob: String = ""
    @State var gender: String = ""
    @State var cardDetails: String = ""
    @State var ssn: String = ""
    @State var mpin: String = ""
    
    var body: some View {
        VStack {
            registerForm
        }
        .background(Color.registerScreenBGColor)
        .ignoresSafeArea()
    }
    
    var registerForm: some View {
        Form {
            CustomTextField(title: Constants.firstName, iconName: "person", value: $firstName)
            CustomTextField(title: Constants.lastName, iconName: "person.badge.plus", value: $lastName)
            CustomTextField(title: Constants.dob, iconName: "calendar", value: $dob)
            CustomTextField(title: Constants.gender, iconName: "person.fill.questionmark", value: $gender)
            CustomTextField(title: Constants.cardDetails, iconName: "creditcard", value: $cardDetails)
            CustomTextField(title: Constants.ssn, iconName: "creditcard.viewfinder", value: $ssn)
            
            CustomTextField(title: Constants.mpin, iconName: "lock", value: $ssn)
            
            HStack {
                Spacer()
                CustomButton(title: Constants.btnSubmit) {
                    print("Register - Submit tapped")
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
