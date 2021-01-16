//
//  HomeViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class HomeViewController: BaseWireFrame<HomeViewModel> {

    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    let cellIdentifier = "HomeTableViewCell"
    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vieeModel.viewDidlead()
    }
    override func bind(ViewModel: HomeViewModel) {
        activityIndicator.startAnimating()
        vieeModel.letestOppertunitesObservable.bind(to: HomeTableView.rx.items(cellIdentifier: cellIdentifier, cellType: HomeTableViewCell.self)){ [weak  self] (index,oppertunite, cell) in
            guard let self = self else {return}
            self.activityIndicator.stopAnimating()
            cell.letestOppertunite.onNext(oppertunite)
            cell.getDeteailesBtn = {
                self.coordinator.mainNavigator.Navigate(to: .OppertuniteDetailesViewController(id: oppertunite.id) )
            }
                
        }.disposed(by: disposePag)
    }
    func registerCell(){
        HomeTableView.backgroundColor = DesignSystem.Colors.BackGround.color
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
