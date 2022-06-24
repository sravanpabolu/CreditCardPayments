//
//  Enums.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation

enum EndPoint {
    case recentTransactions

    func getUrl() -> URL? {
        switch self {
        case .recentTransactions:
            return Bundle.main.url(forResource: "RecentTransactions", withExtension: "json")
        }
    }
}

enum DataFetchError: Error {
    case url, response, parsing
    case custom(description: String)

    func errorDescription() -> String {
        switch self {
        case .url:
            return "URL Error"
        case .response:
            return "Response Error"
        case .parsing:
            return "Parsing Error"
        case .custom(description: let description):
            return description
        }
    }
}
