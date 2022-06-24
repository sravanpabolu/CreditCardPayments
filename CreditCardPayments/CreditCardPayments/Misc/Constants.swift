//
//  Constants.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import Foundation

struct Constants {
    static let login = "Login"
    static let register = "Register"
    static let firstName = "First Name"
    static let lastName = "Last Name"
    static let dob = "Date of birth"
    static let gender = "Gender"
    static let cardDetails = "Card Details"
    static let ssn = "SSN"
    static let mpin = "MPIN"
    static let btnSubmit = "Submit"
}

extension Constants {
    struct TransactionDetailView {
        static let rewardPoints = "REWARD POINTS"
        static let paymentDetails = "PAYMENT DETAILS"
    }
}

extension Constants {
    struct Alert {
        static let titleAlert = "Alert"
        static let msgInvalidMPIN = "Invalid MPIN"
    }
}

extension Constants {
    struct Defaults {
        static let loginKey = "user_login"
    }
}
