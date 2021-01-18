//
//  OppertunitesModel.swift
//  Opportunities
//
//  Created by youssef on 1/4/21.
//  Copyright © 2021 youssef. All rights reserved.
//
import Foundation

struct OppertunitesModel: Codable {
    let id,amount,stay: Int
    let name: String
    let videoDeal: String
    let detail, brief, minimum, maximum: String
    let total, timeLeft, expected, duration: String
    let salesDevelopments, country, projectShipment, recommendations, icon : String
    let shipmentDevelopments, snapshotProduct, participationReturns, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case videoDeal = "video_deal"
        case detail, brief, minimum, maximum, total
        case timeLeft = "time_left"
        case expected, duration
        case salesDevelopments = "sales_developments"
        case country
        case projectShipment = "Project_shipment"
        case recommendations
        case shipmentDevelopments = "shipment_developments"
        case snapshotProduct = "Snapshot_Product"
        case participationReturns = "participation_returns"
        case createdAt = "created_at"
        case amount
        case stay
    }
}
