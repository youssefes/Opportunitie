//
//  NotificationViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class NotificationViewController: BaseWireFrame<NotificationViewModel> {
    
    @IBOutlet weak var NotificationTableView: UITableView!
    
    let CellIdentifier = "NotificationTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        registerCell()
        
    }
    
    override func bind(ViewModel: NotificationViewModel) {
        
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
    
    @IBAction func CloseBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}

extension NotificationViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! NotificationTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    
    
    
}

extension NotificationViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundColor = DesignSystem.Colors.Title.color
        headerView.textLabel?.text = "youssef"
        headerView.textLabel?.font = DesignSystem.Typography.Title.font
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        
        let retaionAngelInRadian = 90 * CGFloat(Double.pi / 180)
        let rotationTransform = CATransform3DMakeRotation(retaionAngelInRadian, 0, 0, 1)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1.2) {
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 100, 0)
        }
    }
    
    
}

