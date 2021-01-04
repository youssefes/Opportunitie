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

    var method: HTTPMethod {
        switch self {
        case .LetestOppertunite,.OppertuniteDetailes:
            return .post
        case .allOppertunites:
              return .get
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
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .LetestOppertunite, .allOppertunites,.OppertuniteDetailes:
            return URLEncoding.default
        }
    }

}
