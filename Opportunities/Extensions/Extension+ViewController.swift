//
//  Extension+ViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentAlertOnMainThread( message: String,buttontitle: String, buttonTitle2: String) {
        DispatchQueue.main.async {
            let alertVC = CustomAlertVC(Massage: message, titleBtn1: buttontitle, titleBtn2: buttonTitle2)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    

}


