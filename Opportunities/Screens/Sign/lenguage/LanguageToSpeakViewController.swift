//
//  ViewController.swift
//  Opportunities
//
//  Created by youssef on 12/1/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class LanguageToSpeakViewController : BaseWireFrame<LanguageToSpeakeViewModel> {
    
    
    @IBOutlet weak var chechBtnEnglish: UIButton!
    @IBOutlet weak var checkBtnArbic: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func bind(ViewModel: LanguageToSpeakeViewModel) {
        
    }
    
    
    @IBAction func EnglishBtn(_ sender: Any) {
        chechBtnEnglish.setImage(#imageLiteral(resourceName: "arrow right alt"), for: .normal)
        checkBtnArbic.isHidden = true
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .IntrodactionView)
         present(viewc, animated: true, completion: nil)
        
    }
    
    @IBAction func arbicBtn(_ sender: Any) {
        checkBtnArbic.setImage(#imageLiteral(resourceName: "arrow right alt"), for: .normal)
        chechBtnEnglish.isHidden = true
         let viewc = coordinator.MainStoryBordNavigator.viewController(for: .IntrodactionView)
        present(viewc, animated: true, completion: nil)
    }
    
    
}

