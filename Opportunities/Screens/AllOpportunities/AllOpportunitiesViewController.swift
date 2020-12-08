//
//  OpportubitieDetsileViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class AllOpportunitiesViewController: UIViewController {

    @IBOutlet weak var numberofOppertuniteLbl: UILabel!
    @IBOutlet weak var OppertunitieTableview: UITableView!
    
    let cellIdentifier = "HomeTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setUpUI()

        
    }
    
    func registerCell(){
        OppertunitieTableview.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setUpUI(){
        OppertunitieTableview.delegate = self
        OppertunitieTableview.dataSource = self
        OppertunitieTableview.separatorStyle = .none
    }

}



extension AllOpportunitiesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    
    
}

extension AllOpportunitiesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
    
}
