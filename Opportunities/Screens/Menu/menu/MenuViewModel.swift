//
//  MenuViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
class MenuViewModel {
    
   private let ArrayOfMenue : [String] = ["Language","Contact Us","About","Fatwa","FAQ"]
    
    var numberOfItems: Int {
        return ArrayOfMenue.count
    }
}
