//
//  ItemTableViewCell.swift
//  PracticeTableView
//
//  Created by Chakpiwat Pacharajindawat on 174//60 BE.
//  Copyright © 2560 Codium. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
