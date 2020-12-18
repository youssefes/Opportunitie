//
//  ViewController.swift
//  Opportunities
//
//  Created by youssef on 12/1/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class LanguageToSpeakViewController : BaseWireFrame<LanguageToSpeakeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind(ViewModel: LanguageToSpeakeViewModel) {
        
    }
    
    
    @IBAction func EnglishBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .IntrodactionView)
         present(viewc, animated: true, completion: nil)
        
    }
    
    @IBAction func arbicBtn(_ sender: Any) {
         let viewc = coordinator.MainStoryBordNavigator.viewController(for: .IntrodactionView)
        present(viewc, animated: true, completion: nil)
    }
    
    
}

