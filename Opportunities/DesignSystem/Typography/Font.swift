//
//  Font.swift
//  Opportunities
//
//  Created by youssef on 12/1/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation


enum Font : String {
    case Bold = "Cairo-Bold"
    case Light = "Cairo-Light"
    case SemiBold = "Cairo-SemiBold"
    case ExtralLight = "Cairo-ExtraLight"
    case Black = "Cairo-Black"
    case Regular = "Cairo-Regular"
    
    var name : String {
        return self.rawValue
    }
}
