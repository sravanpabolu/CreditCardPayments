//
//  Color.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 16/06/22.
//

import SwiftUI

//extension UIColor {
//    convenience init(hex: Int) {
//        let components = (
//            R: CGFloat((hex >> 16) & 0xff) / 255,
//            G: CGFloat((hex >> 08) & 0xff) / 255,
//            B: CGFloat((hex >> 00) & 0xff) / 255
//        )
//        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
//    }
//}
//
//extension Color {
//    public init(hex: Int) {
//        self.init(UIColor(hex: hex))
//    }
//
//    static func hexColour(hexValue:UInt32) -> Color {
//        let red = Double((hexValue & 0xFF0000) >> 16) / 255.0
//        let green = Double((hexValue & 0xFF00) >> 8) / 255.0
//        let blue = Double(hexValue & 0xFF) / 255.0
//        return Color(red:red, green:green, blue:blue)
//    }
//}

//extension Color {
//    static var registerScreenBGColor: Color {
////        Color.hexColour(hexValue: 0xC7B7E0)
//        Color(hex: 0xC7B7E0)
//    }
//
//    static var textFieldTitleColor: Color {
//        Color.hexColour(hexValue: 0x7A55B7)
//    }
//
//    static var buttonBGColor: Color {
//        Color.hexColour(hexValue: 0x8764C1)
//    }
//}

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
