//
//  LangoageViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class LangoageViewController: BaseWireFrame<LanguageViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func bind(ViewModel: LanguageViewModel) {
        
    }

    @IBAction func dismissBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
