//
//  Page.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 15/06/22.
//

import SwiftUI

struct Page: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .ignoresSafeArea()
    }
}

struct Page_Previews: PreviewProvider {
    static var previews: some View {
        Page(imageName: "1.Intro")
    }
}
