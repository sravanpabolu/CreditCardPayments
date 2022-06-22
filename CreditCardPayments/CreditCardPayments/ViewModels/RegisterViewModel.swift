//
//  RegisterViewModel.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var user: User?

    func saveUser() {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: Constants.UserDefaults.loginKey)
            print("Save Success")
        }
    }
}
