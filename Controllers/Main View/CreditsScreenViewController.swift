//
//  CreditsScreenViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/24/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class CreditsScreenViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar(animated)
        hideTabBarController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideNavigationBar(animated)
        showTabBarController()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlToContact: String
        
        switch indexPath.row {
        case 0:
            urlToContact = "http://coolclimate.berkeley.edu"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 1:
            urlToContact = "https://firebase.google.com"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 2:
            urlToContact = "https://www.makeschool.com"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 3:
            urlToContact = "https://github.com/SwiftyJSON/SwiftyJSON"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 4:
            urlToContact = "https://github.com/tadija/AEXML"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 5:
            urlToContact = "https://github.com/drmohundro/SWXMLHash"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 6:
            urlToContact = "help.greenfoot@gmail.com"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 7:
            urlToContact = "https://www.freeprivacypolicy.com/privacy/view/deb4670728e0e6f278e50ae3899526bf"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        case 8:
            urlToContact = "https://greenfoothelp.weebly.com"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        default:
            return
        }
    }

}
