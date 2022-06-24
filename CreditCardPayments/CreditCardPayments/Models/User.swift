//
//  User.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation

enum Gender: String, Codable {
    case male = "Male", female = "Female"
}

struct User: Codable {
    let firstName, lastName: String
    let dateOfBirth: String
    let gender: Gender
    let cardDetails: String
    let ssn: String
    let mpin: String

    enum CodingKeys: CodingKey {
        case firstName
        case lastName
        case dateOfBirth
        case gender
        case cardDetails
        case ssn
        case mpin
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.gender, forKey: .gender)
        try container.encode(self.cardDetails, forKey: .cardDetails)
        try container.encode(self.ssn, forKey: .ssn)
        try container.encode(self.mpin, forKey: .mpin)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.cardDetails = try container.decode(String.self, forKey: .cardDetails)
        self.ssn = try container.decode(String.self, forKey: .ssn)
        self.mpin = try container.decode(String.self, forKey: .mpin)
    }

    init(firstName: String, lastName: String,
         dateOfBirth: String, gender: Gender,
         cardDetails: String, ssn: String,
         mpin: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.cardDetails = cardDetails
        self.ssn = ssn
        self.mpin = mpin
    }
}
