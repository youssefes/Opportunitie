//
//  SearchViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: BaseWireFrame<searchViewModel> {
    
    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var stachSearch: UIStackView!
    @IBOutlet weak var numberOfResulte: UILabel!
    @IBOutlet weak var resulteTableView: UITableView!
    @IBOutlet weak var ContainerOfResultSearch: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let cellIdentifier = "HomeTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vieeModel.viewDidLoad()
        resulteTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        resulteTableView.delegate = self
    }
    
    override func bind(ViewModel: searchViewModel) {
        // bind number of result
        searchTextField.rx.text.orEmpty.bind(to: ViewModel.searchText).disposed(by: disposePag)
        ViewModel.numberOfresulteAsobservable.subscribe(onNext: { [weak self] (number) in
            guard let self = self else {return}
            if number > 0{
                self.stachSearch.isHidden = true
                self.imageSearch.isHidden = true
                self.ContainerOfResultSearch.isHidden = false
            }else{
                self.stachSearch.isHidden = false
                self.imageSearch.isHidden = false
                self.ContainerOfResultSearch.isHidden = true
            }
            self.numberOfResulte.text = "\(number) Resulte"
        }).disposed(by: disposePag)
        
        // bind data resulte
        vieeModel.OppertuniteDetailesObservable.bind(to: resulteTableView.rx.items(cellIdentifier: cellIdentifier, cellType: HomeTableViewCell.self)){ [weak  self] (index,oppertunite, cell) in
            guard let self = self else {return}
            cell.searchOppertunite.onNext(oppertunite)
            cell.getDeteailesBtn = {
                self.coordinator.mainNavigator.Navigate(to: .OppertuniteDetailesViewController(id: oppertunite.id) )
            }
            
        }.disposed(by: disposePag)
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        coordinator.dismiss()
    }
    
    
}

extension SearchViewController :  UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
}
