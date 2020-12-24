//
//  ActiveCollectionViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ActiveCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var selectedCellImage: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
