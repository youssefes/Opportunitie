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
        vieeModel.viewDidLoed()
        registerCells()
    }
    
    override func bind(ViewModel: ActiveViewModel) {
        ViewModel.AllInsterementesObservable.bind(to: activeTableView.rx.items(cellIdentifier: CellTAbleViewIdentifier, cellType: ActiveTableViewCell.self)){
            (index,insterment,cell) in
            cell.instarementData.onNext(insterment)
        }.disposed(by: disposePag)
        ViewModel.numberOfInstrament.subscribe(onNext: {[weak self] (number) in
             guard let self = self else {return}
            self.numberOfInvestment.text = "\(number) Investments"
        }).disposed(by: disposePag)
        
        ViewModel.errorMassage.subscribe(onNext: { [weak self] (massage) in
            guard let self = self else {return}
            if !massage.isEmpty {
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
        }).disposed(by: disposePag)
    }
    func registerCells(){
        ActiveCollectionView.register(UINib(nibName: CellCollectionViewIdentifier, bundle: nil), forCellWithReuseIdentifier: CellCollectionViewIdentifier)
        activeTableView.register(UINib(nibName: CellTAbleViewIdentifier, bundle: nil), forCellReuseIdentifier: CellTAbleViewIdentifier)
        
        activeTableView.delegate = self
        ActiveCollectionView.dataSource = self
        ActiveCollectionView.delegate = self
        
    }
    @IBAction func searchBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Search)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
}

extension ActiveViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 50
        return CGSize(width: width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionViewIdentifier, for: indexPath) as! ActiveCollectionViewCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator.mainNavigator.Navigate(to: .InvestmentDetailsViewController)
    }
    
    
    
    
}

extension ActiveViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellAnimation(cell: cell)
    }
   
    
    
}
