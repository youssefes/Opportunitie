//
//  InvestementViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class InvestementViewModel {
    
    var oppertunites : OppertunitesModel
    
    init(oppertunitesId : OppertunitesModel) {
        self.oppertunites = oppertunitesId
    }
}
