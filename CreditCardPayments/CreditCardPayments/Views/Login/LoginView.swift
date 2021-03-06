//
//  LoginView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    @State var mpin: String = ""
    @State var isShowingAlert = false
    @State var isLoginSuccess = false
    
    var body: some View {
        Form {
            Text("Hello \(self.loginViewModel.user?.firstName ?? "User")")
                .font(.largeTitle)
            CustomTextField(title: Constants.mpin, iconName: "lock", value: $mpin)
            
            HStack {
                Spacer()
                CustomButton(title: Constants.btnSubmit) {
                    loginWithMPIN()
                }
                Spacer()
            }
        }
        .background(Color.registerScreenBGColor)
        .onAppear {
            loginViewModel.retrieveUser()
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text(Constants.Alert.titleAlert), message: Text(Constants.Alert.msgInvalidMPIN))
        }
        .fullScreenCover(isPresented: $isLoginSuccess) {
            DashboardView()
        }
    }

    private func loginWithMPIN() {
        if loginViewModel.verifyLogin(with: mpin) {
            isLoginSuccess = true
        } else {
            isShowingAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewModel())
    }
}
