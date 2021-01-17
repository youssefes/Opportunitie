//
//  UserModel.swift
//  Opportunities
//
//  Created by youssef on 12/22/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
struct User: Codable {
    
    let id: Int?
    let name, email: String
    let status: Int?
    let emailVerifiedAt: String?
    let mobile , image: String?
    let account_bank: String?
    let amount, profit :Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email
        case emailVerifiedAt = "email_verified_at"
        case  mobile , image
        case  amount, profit
        case  account_bank = "accountBank"
        case status
    }
}

// MARK: - TransactionModel
struct TransactionModel: Codable {
    let type, name, amount: String?
}
