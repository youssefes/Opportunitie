//
//  HomeViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    func registerCell(){
        HomeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func setUpUI(){
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.separatorStyle = .none
    }
    @IBAction func showAll(_ sender: Any) {
        
        
    }
    
    @IBAction func showMenu(_ sender: Any) {
    }
    
    
    @IBAction func Shownotifcation(_ sender: Any) {
    }
    
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    
    
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
    
}
