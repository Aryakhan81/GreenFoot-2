//
//  ViewController+Utility.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/4/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import  UIKit

extension UIViewController {
    func hideNavigationBar(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func hideTabBarController() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func showTabBarController() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
