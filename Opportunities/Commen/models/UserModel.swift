//
//  UserModel.swift
//  Opportunities
//
//  Created by youssef on 12/22/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
struct User: Codable {
    let id: Int
    let name, email, emailVerifiedAt: String
    let status: Int

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case emailVerifiedAt = "email_verified_at"
        case status
    }
}
