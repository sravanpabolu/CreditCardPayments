//
//  CustomTextField.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 17/06/22.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let iconName: String?
    @Binding var value: String
    var body: some View {
        HStack {
            if let iconName = iconName {
                Image(systemName: iconName)
            } else {
                EmptyView()
            }
            TextField(title, text: $value)
                .font(Font.textFieldTitleFont)
        }
        .padding()
        .background(.white)
    }
}
