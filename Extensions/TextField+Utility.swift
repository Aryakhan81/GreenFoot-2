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
        if self.text != nil || self.text! != "" {
            return false
        } else {
            return true
        }
    }
    func checkLegnth(_ controller: UIViewController, to length: Int) {
        if self.text!.count > length {
            let alert = UIAlertController(title: "Value Too Large", message: "The value that you entered into one or more fields is too large", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                self.becomeFirstResponder()
            }))
            controller.present(alert, animated: true)
            return
        }
    }
}
