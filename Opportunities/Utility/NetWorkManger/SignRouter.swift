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
    case profile(parameter : Parameters)
    case ContectUs(parameter : Parameters)
    
    
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
        case .profile , .ContectUs:
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
            return "check_code_activmobile"
        case .profile:
            return "profile"
        case .ContectUs:
            return "contactus"
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
        case .profile(let parameter):
            return parameter
        case .ContectUs(let parameter):
            return parameter
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .SignUp , .SignIn , .forgetPass, .ChangePass, .checkCodeActivEmail, .profile,.ContectUs:
            return URLEncoding.default
        }
    }
    
    var header: HTTPHeaders {
          switch self {
          case .SignUp , .SignIn , .forgetPass, .ChangePass, .checkCodeActivEmail, .profile,.ContectUs:
            let header = HTTPHeaders([HTTPHeader(name: "Accept-Language", value: "en")])
              return header
          }
      }


}
