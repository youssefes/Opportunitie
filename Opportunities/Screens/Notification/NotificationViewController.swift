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
    let CellIdentifierHeader = "NotificationHeaderTableViewCell"
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
        self.presentAlertOnMainThread(message: "Are you sure you want to clear all notifications?" , buttontitle: "Cancel", buttonTitle2: "Delete",isoneBtn: false)
    }
    
    func registerCell(){
        NotificationTableView.register(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        NotificationTableView.register(UINib(nibName: CellIdentifierHeader, bundle: nil), forCellReuseIdentifier: CellIdentifierHeader)
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

extension NotificationViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierHeader) as! NotificationHeaderTableViewCell
        cell.titleLbl.text = "Today"
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellAnimation(cell: cell)
    }
    
    
}

