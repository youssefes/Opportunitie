//
//  Instrements.swift
//  Opportunities
//
//  Created by youssef on 1/17/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation

// MARK: - AllInstraments

struct AllInstraments: Decodable {
    let name, amount, profit, createdAt, icon: String

    enum CodingKeys: String, CodingKey {
        case name, amount, profit, icon
        case createdAt = "created_at"
    }
}

// MARK: - AboutModel
struct AboutModel: Codable {
    let about : aboutData
   
}

struct aboutData : Codable {
    let video: String
    let mission, vision: String
    
    enum CodingKeys: String, CodingKey {
        case video, mission, vision
    }
}
