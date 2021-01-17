//
//  TransactionTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var profitOrLoselbl: UILabel!
    
    @IBOutlet weak var containerType: UIView!
    @IBOutlet weak var amountlbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    
    var dispso = DisposeBag()
    var transactionCell : PublishSubject<TransactionModel> = .init()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configration()
    }
    
    func configration(){
        transactionCell.subscribe(onNext: { (transaction) in
            guard let amount = transaction.amount else {return}
            self.amountlbl.text = "\(amount) K"
            self.namelbl.text = transaction.name
            if transaction.type == "profit" {
                self.profitOrLoselbl.text = transaction.type
                self.profitOrLoselbl.textColor = DesignSystem.Colors.SelectedColor.color
                self.profitOrLoselbl.backgroundColor = DesignSystem.Colors.typeTransactionCellProfile.color
                
            }else{
                self.profitOrLoselbl.text = transaction.type
                self.profitOrLoselbl.textColor = DesignSystem.Colors.loseColor.color
                self.profitOrLoselbl.backgroundColor = DesignSystem.Colors.loseColorBackground.color
            }
            
        }).disposed(by: dispso)
    }
    
}
