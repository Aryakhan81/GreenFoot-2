//
//  MissionTableViewCell.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/24/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class MissionTableViewCell: UITableViewCell {
    //@IBOutlets
    @IBOutlet weak var missionText: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        completeButton.layer.cornerRadius = 8
    }

}
