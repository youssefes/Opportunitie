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
        ViewModel.viewDidlead()
        ViewModel.allOppertunitesObservable.bind(to: OppertunitieTableview.rx.items(cellIdentifier: cellIdentifier, cellType: HomeTableViewCell.self)){[weak self] (index, oppertunites, cell) in
            cell.letestOppertunite.onNext(oppertunites)
            cell.getDeteailesBtn.rx.tap.subscribe { [weak self](touch) in
                self?.coordinator.mainNavigator.Navigate(to: .OppertuniteDetailesViewController)
            }.disposed(by: self!.disposePag)
        }.disposed(by: disposePag)
    }
    func registerCell(){
        OppertunitieTableview.backgroundColor = DesignSystem.Colors.BackGround.color
        OppertunitieTableview.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setUpUI(){
        OppertunitieTableview.delegate = self
        OppertunitieTableview.separatorStyle = .none
    }
    @IBAction func dismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Search)
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
