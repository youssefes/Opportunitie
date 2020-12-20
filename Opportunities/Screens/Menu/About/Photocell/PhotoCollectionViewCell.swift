//
//  PhotoCollectionViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }

}
