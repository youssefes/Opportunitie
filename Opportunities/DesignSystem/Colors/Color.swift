//
//  Coler.swift
//  Opportunities
//
//  Created by youssef on 12/1/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import UIKit

extension DesignSystem {
    enum Colors : String {
        case Title = "Title"
        case SubTitle = "SubTitle"
        case Difination = "Difination"
        case backGroundButton = "backGroundButton"
        case MainbuttonColor = "MainbuttonColor"
        var color : UIColor {
            switch self {
            case .Title:
                print(self.rawValue)
                return UIColor(named : self.rawValue)!
            case .SubTitle:
                return UIColor(named : self.rawValue)!
            case .Difination:
                return UIColor(named : self.rawValue)!
            case .backGroundButton:
                return UIColor(named : self.rawValue)!
            case .MainbuttonColor:
                return UIColor(named : self.rawValue)!
            }
        }
        
    }
}
