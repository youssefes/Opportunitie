//
//  UserModel.swift
//  Opportunities
//
//  Created by youssef on 12/22/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation

struct User : Decodable {
    var id: Int?
    var name : String?
    var email : String?
    var emailVerifiedAt: String?
    var status: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case emailVerifiedAt = "email_verified_at"
        case status
    }
}
