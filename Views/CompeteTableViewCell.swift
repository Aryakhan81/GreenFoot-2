//
//  CompeteTableViewCell.swift
//  GreenFoot
//
//  Created by Arya Gharib on 9/15/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class CompeteTableViewCell: UITableViewCell {
    //@IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var starsLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
