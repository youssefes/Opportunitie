//
//  NotificationViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var NotificationTableView: UITableView!
    
    let CellIdentifier = "NotificationTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        registerCell()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        
    }
    @IBAction func DeletAll(_ sender: Any) {
        self.presentAlertOnMainThread(message: "Are you sure you want to clear all notifications?", buttontitle: "Cancel", buttonTitle2: "Delete")
        
    }
    
    func registerCell(){
           NotificationTableView.register(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
       }
       
       func setUpUI(){
           NotificationTableView.delegate = self
           NotificationTableView.dataSource = self
           NotificationTableView.separatorStyle = .none
       }
    

}

extension NotificationViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let lable = UILabel(frame: CGRect(x: 20, y: 5, width: viewSection.frame.size.width, height: 50))
        lable.text = "yesterday"
        lable.font = DesignSystem.Typography.Title.font
        lable.textColor = DesignSystem.Colors.LabelColor.color
        lable.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        viewSection.addSubview(lable)
        return viewSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        return cell
    }
    
    
}

extension NotificationViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}

