//
//  ActiveViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ActiveViewController: BaseWireFrame<ActiveViewModel> {
    
    @IBOutlet weak var numberOfInvestment: UILabel!
    @IBOutlet weak var activeTableView: UITableView!
    @IBOutlet weak var ActiveCollectionView: UICollectionView!
    
    
    let CellCollectionViewIdentifier = "ActiveCollectionViewCell"
    let CellTAbleViewIdentifier = "ActiveTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
    
    override func bind(ViewModel: ActiveViewModel) {
        
    }
    func registerCells(){
        ActiveCollectionView.register(UINib(nibName: CellCollectionViewIdentifier, bundle: nil), forCellWithReuseIdentifier: CellCollectionViewIdentifier)
        activeTableView.register(UINib(nibName: CellTAbleViewIdentifier, bundle: nil), forCellReuseIdentifier: CellTAbleViewIdentifier)
       
        activeTableView.dataSource = self
        activeTableView.delegate = self
        
        ActiveCollectionView.dataSource = self
        ActiveCollectionView.delegate = self
        
    }
    @IBAction func searchBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Search)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ActiveViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 50
        return CGSize(width: width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionViewIdentifier, for: indexPath) as! ActiveCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator.mainNavigator.Navigate(to: .InvestmentDetailsViewController)
    }
    
    
    
    
}

extension ActiveViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellTAbleViewIdentifier, for: indexPath) as! ActiveTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.mainNavigator.Navigate(to: .Language)
    }
    
    
}
