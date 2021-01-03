//
//  OpportubitieDetsileViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class AllOpportunitiesViewController: BaseWireFrame<AllOppertunitesViewModel> {

    @IBOutlet weak var numberofOppertuniteLbl: UILabel!
    @IBOutlet weak var OppertunitieTableview: UITableView!
    
    let cellIdentifier = "HomeTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setUpUI()

        
    }
    override func bind(ViewModel: AllOppertunitesViewModel) {
        
    }
    func registerCell(){
        OppertunitieTableview.backgroundColor = DesignSystem.Colors.BackGround.color
        OppertunitieTableview.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setUpUI(){
        OppertunitieTableview.delegate = self
        OppertunitieTableview.dataSource = self
        OppertunitieTableview.separatorStyle = .none
    }
    @IBAction func dismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Search)
    }
}



extension AllOpportunitiesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.goToDetaielsOfOppertunite = { [weak self] in
            self?.coordinator.mainNavigator.Navigate(to: .OppertuniteDetailesViewController)
        }
        return cell
    }
    
    
}

extension AllOpportunitiesViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
    
    
    
}
