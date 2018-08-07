//
//  Double+Utility.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/4/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation

extension Double {
    func round(to place: Int) -> Double {
        return Double(floor(pow(10.0, Double(place)) * self)/pow(10.0, Double(place)))
    }
}
