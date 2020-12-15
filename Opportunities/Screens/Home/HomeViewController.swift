//
//  HomeViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class HomeViewController: BaseWireFrame<HomeViewModel> {

    @IBOutlet weak var HomeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    
    override func bind(ViewModel: HomeViewModel) {
        
    }
    func registerCell(){
//        HomeTableView.backgroundColor = DesignSystem.Colors.BackGround.color
        HomeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setUpUI(){
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
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

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.goToDetaielsOfOppertunite = { [weak self] in
            self?.coordinator.mainNavigator.Navigate(to: .OppertuniteDetailesViewController)
        }
        return cell
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
