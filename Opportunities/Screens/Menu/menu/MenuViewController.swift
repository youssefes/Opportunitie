//
//  MenuViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class MenuViewController: BaseWireFrame<MenuViewModel> {
    
    
 
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    let ArrayOfMenue : [String] = [
        NSLocalizedString("Language", comment: "open language vc")
        ,NSLocalizedString("Contact Us", comment: "open Contact Us vc"),
         NSLocalizedString("About", comment: "open about Us vc"),
        NSLocalizedString("Fatwa", comment: "open about Us vc")
        ,NSLocalizedString("FAQ", comment: "open FAQ Us vc")]
    
    let CellIdentifier = "MenuTableViewCell"
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerCell()
        menuTableView.semanticContentAttribute = .unspecified
    }
    
    func setupTableView(){
        if let userid = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int{
            loginBtn.setTitle(NSLocalizedString("LogOut", comment: ""), for: .normal)
            print(userid)
        }else{
            loginBtn.setTitle(NSLocalizedString("LogIn", comment: ""), for: .normal)
        }
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    func registerCell(){
        menuTableView.register(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
    }
    
    override func bind(ViewModel: MenuViewModel) {
        
    }
    
    
    @IBAction func clsoeBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func logOutBtn(_ sender: UIButton) {
        if let userid = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int{
            sender.setTitle(NSLocalizedString("logIn", comment: "it is title of button login or not login"), for: .normal)
            UserDefaults.standard.removeObject(forKey: NetworkConstants.userIdKey)
            coordinator.isLogIn = false
            coordinator.firstTimeOpen = false
            
            print(userid)
        }else{
            let VC = coordinator.MainStoryBordNavigator.viewController(for: .SignInView)
            UIApplication.shared.keyWindow?.rootViewController = VC
        }
    }
}

extension MenuViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            case 0:
                coordinator.mainNavigator.Navigate(to: .Language)
            case 1:
               coordinator.mainNavigator.Navigate(to: .contectUs)
            case 2:
              coordinator.mainNavigator.Navigate(to: .About)
            case 3:
                print("faq")
            default:
                print("no ViewController")
            }
    }
    
    
}


extension MenuViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayOfMenue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  CellIdentifier, for: indexPath) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.textLbl.text = ArrayOfMenue[indexPath.row]
        
        return cell
    }
    
    

    
    
}
