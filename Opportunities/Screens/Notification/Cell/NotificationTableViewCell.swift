//
//  NotificationTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
          selectionStyle = .none
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
}
