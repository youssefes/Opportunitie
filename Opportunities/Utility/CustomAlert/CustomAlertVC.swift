//
//  CustomAlertVC.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class CustomAlertVC: UIViewController {

    @IBOutlet weak var titleBtn2: UIButton?
    @IBOutlet weak var titleBtn1: UIButton?
    @IBOutlet weak var massageLbl: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    init(Massage : String,titleBtn1 : String , titleBtn2: String) {
        super.init(nibName: nil, bundle: nil)
        self.massageLbl?.text = Massage
        self.titleBtn2?.setTitle(titleBtn2, for: .normal)
        self.titleBtn1?.setTitle(titleBtn1, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DeleteBtn(_ sender: Any) {
        
    }
    
}
