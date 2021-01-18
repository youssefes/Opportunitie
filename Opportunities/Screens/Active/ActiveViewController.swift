//
//  ActiveViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

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
        
        // MARK := bind collectionViewActive
        ViewModel.AllInsterementesObservable.bind(to: activeTableView.rx.items(cellIdentifier: CellTAbleViewIdentifier, cellType: ActiveTableViewCell.self)){
            (index,insterment,cell) in
            cell.instarementData.onNext(insterment)
        }.disposed(by: disposePag)
        
        // MARK := bind tableView
        ViewModel.OppertuniteDetailesObservable.bind(to: ActiveCollectionView.rx.items(cellIdentifier: CellCollectionViewIdentifier, cellType: ActiveCollectionViewCell.self)){
            (index,opertunites,cell) in
            cell.ActiveOppertunite.onNext(opertunites)
        }.disposed(by: disposePag)
        
        // MARK := bind number Of Instrament
        ViewModel.numberOfInstrament.subscribe(onNext: {[weak self] (number) in
            guard let self = self else {return}
            self.numberOfInvestment.text = "\(number) Investments"
        }).disposed(by: disposePag)
        
        
        // MARK := bind error massahe
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
        ActiveCollectionView.rx.setDelegate(self).disposed(by: disposePag)
        activeTableView.delegate = self
        ActiveCollectionView.delegate = self
        
        
        // MARK := bind didselectCollectionViewRow
        ActiveCollectionView.rx.modelSelected(OppertunitesModel.self).subscribe(onNext: { [weak self] (oppertunite) in
            guard let self = self else {return}
            self.coordinator.mainNavigator.Navigate(to: .InvestmentDetailsViewController(oppertuniteIb: oppertunite))
        }).disposed(by: disposePag)
        
        
    }
    @IBAction func searchBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Search)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
}

extension ActiveViewController :  UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 100
        return CGSize(width: width, height: 220)
    }
    
    
}

extension ActiveViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellAnimation(cell: cell)
    }
    
    
    
}
