//
//  TransactionsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    @IBOutlet weak var TransactionsTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let CellIdentifierHeader = "HeaderTableViewCell"
    let cellOfItem = "TransactionTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        RegisterCells()
        setUpUI()
    }
    
    func RegisterCells() {
        TransactionsTableView.register(UINib(nibName: CellIdentifierHeader, bundle: nil), forCellReuseIdentifier: CellIdentifierHeader)
        TransactionsTableView.register(UINib(nibName: cellOfItem, bundle: nil), forCellReuseIdentifier: cellOfItem)
        
        TransactionsTableView.dataSource = self
        TransactionsTableView.delegate = self
    }
    
    func setUpUI(){
        
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white , NSAttributedString.Key.font: DesignSystem.Typography.SegmentControl.font], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: DesignSystem.Colors.LabelColor.color , NSAttributedString.Key.font: DesignSystem.Typography.SegmentControl.font], for: .normal)
        
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func downloadBtn(_ sender: Any) {
    }
    
}
extension TransactionsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierHeader) as! HeaderTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellOfItem, for: indexPath) as! TransactionTableViewCell
        return cell
    }
    
    
}

extension TransactionsViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
