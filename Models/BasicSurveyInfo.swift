//
//  BasicSurveyInfo.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/13/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation

struct BasicSurveyInfo {
    var input_location: String?
    var input_income: Int?
    var input_location_mode: Int?
    var input_size: Int?
    
    init() {
        self.input_location = nil
        self.input_income = nil
        self.input_location_mode = nil
        self.input_size = nil
    }
}
