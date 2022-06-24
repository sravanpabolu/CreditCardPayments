//
//  Double.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation

extension Double {
    func round(to decimalPlaces: Int) -> Double {
        let precisionNumber = pow(10, Double(decimalPlaces))
        var number = self // self is a current value of the Double that you will round
        number *= precisionNumber
        number.round()
        number /= precisionNumber
        return number
    }
}
