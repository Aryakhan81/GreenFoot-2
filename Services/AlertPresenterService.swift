//
//  AlertPresenterService.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/9/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import UIKit

struct AlertPresenterService {
    static func alertEmptyField(_ presenter: UIViewController){
        let alert = UIAlertController(title: "Empty Fields", message: "You have left one or more fields on this page empty. Please fill these out before continuing ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil))
        presenter.present(alert, animated: true)
    }
}
