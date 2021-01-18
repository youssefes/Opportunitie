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
    
    
    
    let ArrayOfMenue : [String] = ["Language","Contact Us","About","Fatwa","FAQ"]
    
    let CellIdentifier = "MenuTableViewCell"
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerCell()
    }
    
    func setupTableView(){
        if let userid = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int{
            loginBtn.setTitle("LogOut", for: .normal)
            print(userid)
        }else{
           loginBtn.setTitle("LogIn", for: .normal)
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
            sender.setTitle("login", for: .normal)
            UserDefaults.standard.removeObject(forKey: NetworkConstants.userIdKey)
            coordinator.isLogIn = false
            coordinator.firstTimeOpen = false

            print(userid)
        }else{
            let VC = coordinator.MainStoryBordNavigator.viewController(for: .SignInView)
            coordinator.tabBarController.removeFromParent()
            present(VC, animated: true, completion: nil)
        }
    }
}

extension MenuViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch ArrayOfMenue[indexPath.row] {
            case "Language":
                coordinator.mainNavigator.Navigate(to: .Language)
            case "Contact Us":
               coordinator.mainNavigator.Navigate(to: .contectUs)
            case "About":
              coordinator.mainNavigator.Navigate(to: .About)
            case "FAQ":
               coordinator.mainNavigator.Navigate(to: .Language)
            case "Fatwa" :
               coordinator.mainNavigator.Navigate(to: .Language)
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
