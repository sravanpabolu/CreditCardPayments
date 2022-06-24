//
//  Color.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

extension Color {
    static var titleColor: Color {
        Color(red: 135/255, green: 103/255, blue: 192/255)
    }
    static var registerScreenBGColor: Color {
        Color(red: 248/255, green: 249/255, blue: 253/255)
    }

    static var textFieldTitleColor: Color {
        Color(red: 97/255, green: 79/255, blue: 132/255)
    }

    static var buttonBGColor: Color {
        Color(red: 135/255, green: 103/255, blue: 192/255)
    }
}

extension ShapeStyle where Self == Color {
    static var debitCapsuleBG: Color {
        Color(red: 255/255, green: 216/255, blue: 229/255)
    }

    static var creditCapsuleBG: Color {
        Color(red: 222/255, green: 253/255, blue: 220/255)
    }

    static var goldBG: Color {
        Color(red: 255/255, green: 215/255, blue: 0/255)
    }

    static var goldFont: Color {
        Color(red: 212/255, green: 175/255, blue: 55/255)
    }
}
