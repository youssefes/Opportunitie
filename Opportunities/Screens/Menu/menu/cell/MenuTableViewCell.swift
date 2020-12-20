//
//  MenuTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isSelected {
            self.selectionStyle = .default
            self.contentView.backgroundColor = DesignSystem.Colors.BackGround.color
            textLabel?.highlightedTextColor = DesignSystem.Colors.SelectedColor.color
        }else{
            textLabel?.highlightedTextColor = DesignSystem.Colors.SelectedColor.color
        }
        
        
        
    }
    
}
