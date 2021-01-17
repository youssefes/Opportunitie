//
//  ActiveTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ActiveTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var profilelbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    let dispassbag = DisposeBag()
     var instarementData : PublishSubject<AllInstraments> = .init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configration()
        // Configure the view for the selected state
    }
    
    func configration(){
        instarementData.subscribe(onNext: { [weak self] (instremen) in
            guard let self = self else{return}
            self.namelbl.text = instremen.name
            self.profilelbl.text = "\(instremen.profit) K"
            self.timeLbl.text = instremen.createdAt
        }).disposed(by: dispassbag)
    }
    
}
