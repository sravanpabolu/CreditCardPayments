//
//  CustomTitle.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 17/06/22.
//

import SwiftUI

struct CustomTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(Color.titleColor)
    }
}

struct CustomTitle_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitle(title: "Hello")
    }
}
