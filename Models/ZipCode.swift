//
//  ZipCode.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ZipCode {
    let stateAbbv: String
    
    init(json: JSON) {
        self.stateAbbv = json["item"]["State"].stringValue
    }
}
