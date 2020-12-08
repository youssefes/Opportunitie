//
//  Font.swift
//  Opportunities
//
//  Created by youssef on 12/1/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation


enum Font : String {
    case Bold = "Gilroy-Bold"
    case Light = "Gilroy-Light"
    case Regular = "Gilroy-Regular"
    case Medium = "Gilroy-Medium"
    case Heavy = "Gilroy-Heavy"
    var name : String {
        return self.rawValue
    }
}
