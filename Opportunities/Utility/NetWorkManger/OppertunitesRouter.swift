//
//  OppertunitesRouter.swift
//  Opportunities
//
//  Created by youssef on 1/4/21.
//  Copyright © 2021 youssef. All rights reserved.
//


import Foundation
import Alamofire

enum OppertunitesRouter: APIRouter {
    
    case LetestOppertunite
    case allOppertunites
    case OppertuniteDetailes(dealId : Int)
    case search(opertunitesName : String)

    var method: HTTPMethod {
        switch self {
        case .LetestOppertunite,.OppertuniteDetailes:
            return .post
        case .allOppertunites:
              return .get
        case .search:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .LetestOppertunite:
            return "latest_deals"
        case .allOppertunites:
            return "all_deals"
        case .OppertuniteDetailes:
            return "view_deal"
        case .search:
           return "search"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .LetestOppertunite , .allOppertunites :
            return nil
        case .OppertuniteDetailes(let dealId):
            let parameter : Parameters = [
                "deal_id" : dealId
            ]
            return parameter
        case .search(let opertunitesName):
            let parameter : Parameters = [
                "name" : opertunitesName
            ]
            return parameter
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .search, .LetestOppertunite, .allOppertunites,.OppertuniteDetailes:
            return URLEncoding.default
    }
    }
    
    var header: HTTPHeaders {
        switch self {
        case .LetestOppertunite, .search, .allOppertunites,.OppertuniteDetailes :
            let header = HTTPHeaders([HTTPHeader(name: "Accept-Language", value: "en")])
            return header
        }
    }

}
