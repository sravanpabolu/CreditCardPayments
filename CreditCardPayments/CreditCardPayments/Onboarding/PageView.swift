//
//  PageView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 15/06/22.
//

import SwiftUI

struct PageView: View {
    var imageName: String
//    @State private var currentPage = 0

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
            
//            Text("Current Page: \(currentPage)")
        }
    }
}
