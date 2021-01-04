//
//  HomeTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var getDeteailesBtn: UIButton!
    
    let dispos = DisposeBag()
   var letestOppertunite : PublishSubject<OppertunitesModel> = .init()
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var MainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        letestOppertunite.subscribe { (ope) in
            print(ope)
        }.disposed(by: dispos)
    }
    
    
}
