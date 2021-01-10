//
//  TransactionsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class TransactionsViewController: BaseWireFrame<TransactionsViewMode> {
    
    @IBOutlet weak var TransactionsTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let CellIdentifierHeader = "HeaderTableViewCell"
    let cellOfItem = "TransactionTableViewCell"
    
    var arrayElement : [Int] = [1,1,1,1,1]
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterCells()
        setUpUI()
    }
    override func bind(ViewModel: TransactionsViewMode) {
        
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
        segmentedControl.addTarget(self, action: #selector(DidChangeValue(for:)), for: .valueChanged)
        
    }
    
    @objc func DidChangeValue (for segment : UISegmentedControl){
        if segment.selectedSegmentIndex == 1{
            self.arrayElement = [1,3]
        }else{
            self.arrayElement = [1,4,3,2,3]
        }
        
        TransactionsTableView.reloadData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        coordinator.dismiss()
    }
    
    @IBAction func downloadBtn(_ sender: Any) {
    }
    
}
extension TransactionsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayElement.count
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cellAnimation(cell: cell)
    }
}
