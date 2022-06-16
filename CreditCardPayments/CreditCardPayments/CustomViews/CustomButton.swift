//
//  CustomButton.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 17/06/22.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let buttonAction: () -> Void
    var body: some View {
        Button(title, action: buttonAction)
            .font(Font.buttonTitleFont)
            .frame(width: 200, height: 40)
            .foregroundColor(.white)
            .background(Color.buttonBGColor)
            .padding()
            .containerShape(Capsule())
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Submit") {
            print("Submit tapped")
        }
    }
}
