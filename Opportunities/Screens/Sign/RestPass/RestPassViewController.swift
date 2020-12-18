//
//  RestPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class RestPassViewController: BaseWireFrame<RestPassViewModel> {
    @IBOutlet weak var conformNewPass: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func bind(ViewModel: RestPassViewModel) {
        
    }
    @IBAction func contiune(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SeccessRestPassView)
        present(viewc, animated: true, completion: nil)
    }
    
}
