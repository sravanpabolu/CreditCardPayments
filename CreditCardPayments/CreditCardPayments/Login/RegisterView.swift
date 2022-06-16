//
//  RegisterView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

// First Name, Last Name, DOB, Gender, Card details, SSN (Masked)
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
                .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
        }
        .background(Color.registerScreenBGColor)
        .ignoresSafeArea()
    }
    
    var registerForm: some View {
        VStack {
            CustomTitle(title: Constants.register)
            CustomTextField(title: Constants.first_name, iconName: "person", value: $firstName)
            CustomTextField(title: Constants.last_name, iconName: "person.badge.plus", value: $lastName)
            CustomTextField(title: Constants.dob, iconName: "calendar", value: $dob)
            CustomTextField(title: Constants.gender, iconName: "person.fill.questionmark", value: $gender)
            CustomTextField(title: Constants.card_details, iconName: "creditcard", value: $cardDetails)
            CustomTextField(title: Constants.ssn, iconName: "creditcard.viewfinder", value: $ssn)
            
            CustomTextField(title: Constants.mpin, iconName: "lock", value: $ssn)
            
            CustomButton(title: Constants.btn_submit) {
                print("Submit tapped")
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
