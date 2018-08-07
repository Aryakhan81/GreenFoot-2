//
//  Storyboard+Utility.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/23/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum GFType: String {
        case main
        case login
        case survey
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: GFType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: GFType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        return initialViewController
    }
}
