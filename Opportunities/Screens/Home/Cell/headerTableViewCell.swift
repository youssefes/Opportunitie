//
//  headerTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 3/6/18.
//  Copyright © 2018 youssef. All rights reserved.
//

import UIKit

protocol headerTableViewCellDeleget: class{
    func showAll()
}

class headerTableViewCell: UITableViewCell {

   weak var Deleget : headerTableViewCellDeleget?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showAllOpertunites(_ sender: Any) {
        Deleget?.showAll()
    }
}
