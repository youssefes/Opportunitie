//
//  signRouter.swift
//  Opportunities
//
//  Created by youssef on 12/21/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import Alamofire

enum SignRouter: APIRouter {
    
    case SignUp(parameters : Parameters)
    case SignIn(parameters : Parameters)
    case forgetPass(parameters : Parameters)
    case ChangePass(parameters : Parameters)
    case checkCodeActivEmail(parameters : Parameters)
    
    
    var method: HTTPMethod {
        switch self {
        case .SignUp:
            return .post
        case .SignIn:
            return .post
        case .forgetPass:
            return .post
        case .ChangePass:
            return .post
        case .checkCodeActivEmail:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .SignUp:
            return "register"
        case .SignIn:
            return "login"
        case .forgetPass:
            return "forgot_password"
        case .ChangePass:
            return "change_password"
        case .checkCodeActivEmail:
            return "check_code_activemail"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .SignUp(let parameters):
            return parameters
        case .SignIn(let parameters):
            return parameters
        case .forgetPass(let parameters):
            return parameters
        case .ChangePass(let parameters):
            return parameters
        case .checkCodeActivEmail(let parameters):
            return parameters
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .SignUp:
            return URLEncoding.default
        case .SignIn:
            return URLEncoding.default
        case .forgetPass:
            return URLEncoding.default
        case .ChangePass:
            return URLEncoding.default
        case .checkCodeActivEmail:
            return URLEncoding.default
        }
    }

}
