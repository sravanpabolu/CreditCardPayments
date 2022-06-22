//
//  LoginViewModel.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var user: User?

    func retrieveUser() {
        if let userData = UserDefaults.standard.data(forKey: Constants.Defaults.loginKey) {
            let decoder = JSONDecoder()
            let newUser = try? decoder.decode(User.self, from: userData)
            user = newUser
        } else {
            user = nil
        }
    }
    
    func verifyLogin(with mPIN: String) -> Bool {
        mPIN == user?.mpin ? true : false
    }
}
