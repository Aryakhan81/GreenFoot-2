//
//  TextField+Utility.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/6/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func isEmpty() -> Bool {
        if self.text != nil {
            return false
        } else {
            return true
        }
    }
}
