//
//  InstrementsRouter.swift
//  Opportunities
//
//  Created by youssef on 1/17/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation
import Alamofire

enum InstrementsRouter : APIRouter{
    
    case AllInstraments(userId : Int)
    case transactionThisMonth(userId : Int)
    case transactionLastMonth(userId : Int)
    case transactionAmount(parameters : Parameters)
    var method: HTTPMethod{
        switch self{
        case .AllInstraments:
            return .post
            
        case .transactionThisMonth, .transactionLastMonth,.transactionAmount:
            return .post
       }
    }
    var path: String{
        switch self{
        case .AllInstraments:
            return "All_investments"
        case .transactionThisMonth:
            return "transactionThisMonth"
        case .transactionLastMonth:
            return "transactionLastMonth"
        case .transactionAmount:
            return "transaction_amount"
        }
    }
    
    var parameters: Parameters?{
        switch self{
        case .AllInstraments(let userId):
            let parameters : Parameters = [
                "user_id" : userId
            ]
            return parameters
        case .transactionThisMonth(let userId):
            let parameters : Parameters = [
                "user_id" : userId
            ]
            return parameters
        case .transactionLastMonth(let userId):
            let parameters : Parameters = [
                "user_id" : userId
            ]
            return parameters
        case .transactionAmount(let parameters):
            return parameters
        }
        
       
    }
    
    var encoding: ParameterEncoding{
        switch self{
        case .AllInstraments, .transactionThisMonth,.transactionLastMonth,.transactionAmount:
            return URLEncoding.default
        }
    }
    var header: HTTPHeaders{
        switch self{
        case .AllInstraments,.transactionThisMonth,.transactionLastMonth,.transactionAmount:
            let header = HTTPHeaders([HTTPHeader(name: "Accept-Language", value: "en")])
            return header
        }
    }
    
}
