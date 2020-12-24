//
//  SearchViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SearchViewController: BaseWireFrame<searchViewModel> {

    @IBOutlet weak var numberOfResulte: UILabel!
    @IBOutlet weak var resulteTableView: UITableView!
    @IBOutlet weak var ContainerOfResultSearch: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let cellIdentifier = "HomeTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        
        resulteTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        resulteTableView.dataSource = self
        resulteTableView.delegate = self
        searchTextField.delegate = self
    }

    
    override func bind(ViewModel: searchViewModel) {
        
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        coordinator.dismiss()
    }
    
}

extension SearchViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
}

extension SearchViewController :  UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
}

extension SearchViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ContainerOfResultSearch.isHidden = false
    }
}
