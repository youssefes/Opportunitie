//
//  MainRespondObject.swift
//  Opportunities
//
//  Created by youssef on 12/21/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation

struct ResponseObjectModel<T : Decodable>: Decodable {
    var  value: Bool?
    var status : Bool?
    var  msg : String?
    var  code: Int?
    var  data : T?

}

struct signUpDataModel: Decodable {
        var value: Bool
       var  msg : String
       var  code: Int
}
