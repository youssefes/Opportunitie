//
//  HomeViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class HomeViewController: BaseWireFrame<HomeViewModel> {

    
    let cellIdentifier = "HomeTableViewCell"
    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vieeModel.viewDidlead()
        setUpUI()
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    
    override func bind(ViewModel: HomeViewModel) {
        vieeModel.letestOppertunitesObservable.bind(to: HomeTableView.rx.items(cellIdentifier: cellIdentifier, cellType: HomeTableViewCell.self)){ (index,oppertunite, cell) in
            cell.letestOppertunite.onNext(oppertunite)
        }.disposed(by: disposePag)
    }
    func registerCell(){
//        HomeTableView.backgroundColor = DesignSystem.Colors.BackGround.color
        HomeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setUpUI(){
        HomeTableView.delegate = self
        HomeTableView.separatorStyle = .none
    }
    @IBAction func showAll(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .AllOpportunitiesViewController)
        
    }
    
    @IBAction func showMenu(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .menu)
        
    }
    
    
    @IBAction func Shownotifcation(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Notification)
    }
    
}

extension HomeViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
