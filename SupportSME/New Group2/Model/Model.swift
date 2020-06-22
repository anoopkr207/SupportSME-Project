//
//  Model.swift
//  SupportSME
//
//  Created by daffolapmac146 on 19/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    let result: Result
    let status: String
}

// MARK: - Result
struct Result: Codable {
    let userType: String
    let emailVerification: Bool
    let id: String
    let personalDetails: PersonalDetails
    
    enum CodingKeys: String, CodingKey {
        case userType, emailVerification
        case id = "_id"
        case personalDetails
    }
}

// MARK: - PersonalDetails
struct PersonalDetails: Codable {
    let image: Image
    let id, email, password, phone: String
    let firstName, gender, lastName: String
    
    enum CodingKeys: String, CodingKey {
        case image
        case id = "_id"
        case email, password, phone, firstName, gender, lastName
    }
}

// MARK: - Image
struct Image: Codable {
    let url, name: String
}
