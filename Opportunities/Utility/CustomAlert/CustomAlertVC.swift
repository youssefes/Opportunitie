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
    
    var TitleAlert : String?
    var TitleofBtn1 : String?
    var TitleofBtn2 : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setValueOfUI()
    }
    
    init(Massage : String ,titleBtn1 : String , titleBtn2: String) {
        super.init(nibName: nil, bundle: nil)
        self.TitleAlert = Massage
        self.TitleofBtn1 = titleBtn1
        self.TitleofBtn2 = titleBtn2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValueOfUI(){
        self.massageLbl?.text = TitleAlert
        self.titleBtn2?.setTitle(TitleofBtn2, for: .normal)
        self.titleBtn1?.setTitle(TitleofBtn1, for: .normal)
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DeleteBtn(_ sender: Any) {
        if titleBtn2?.titleLabel?.text == "Delete" {
            print("delet")
        }else{
            print("else")
        }
    }
    
}
