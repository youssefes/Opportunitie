//
//  LangoageViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class LangoageViewController: BaseWireFrame<LanguageViewModel> {
    
    @IBOutlet weak var chechBtnEnglish: UIButton!
    @IBOutlet weak var checkBtnArbic: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func bind(ViewModel: LanguageViewModel) {
        
    }
    @IBAction func containerArbicBtn(_ sender: UIButton) {
        chechBtnEnglish.backgroundColor = DesignSystem.Colors.Colorclear.color
        chechBtnEnglish.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
        checkBtnArbic.backgroundColor = DesignSystem.Colors.SelectedColor.color
        checkBtnArbic.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
    }
    
    @IBAction func containerEnglishBtn(_ sender: Any) {
        chechBtnEnglish.backgroundColor = DesignSystem.Colors.SelectedColor.color
        chechBtnEnglish.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
        checkBtnArbic.backgroundColor = DesignSystem.Colors.Colorclear.color
         checkBtnArbic.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
    }
    @IBAction func dismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}
