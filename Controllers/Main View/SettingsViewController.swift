//
//  SettingsViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/30/20.
//  Copyright © 2020 Sina Gharib. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class SettingsViewController: UITableViewController {
    
    //Get user data...
    let user = try! JSONDecoder().decode(User.self, from: UserDefaults.standard.value(forKey: "currentUser") as! Data)
    
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
        switch indexPath.row {
        case 0:
            //Create the alert
            let alert = UIAlertController(title: "Retake Survey", message: "Are you sure that you would like to retake the survey? This will reset your current carbon footprint, carbon reduced, and star count", preferredStyle: UIAlertControllerStyle.alert)
    
            //Add the 'yes' action
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) { (action) in
                let initialViewController = UIStoryboard.initialViewController(for: .survey)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            })
    
            //Add the 'no' action
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { (action) in
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            self.present(alert, animated: true, completion: nil)
            
            
        case 1:
            let ref = Database.database().reference().child("usernames").child(self.user.username)
            let alert = UIAlertController(title: "Compete With Others?", message: "Would you like to be able to compete and compare star counts against other users? This will allow you to see other users' usernames and star counts but will also allow them to see yours.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                ref.child("shareData").setValue(true, withCompletionBlock: { (error, dr) in
                    
                    ref.observeSingleEvent(of: .value) { (snapshot) in
                        let value = snapshot.value as! [String: Any]
                        let stars = value["stars"] as! Int
                        ref.child("stars").setValue(stars, withCompletionBlock: { (error, dr) in
                            
                        })
                        self.tableView.deselectRow(at: indexPath, animated: true)
                    }
                    
                })
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (action) in
                let alert = UIAlertController(title: "Compete Mode Disabled", message: "You will not be able to see others' usernames and star counts, and they will not be able to see yours. You can change this at any time.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                    ref.child("shareData").setValue(false, withCompletionBlock: { (error, dr) in
                        
                    })
                    self.tableView.deselectRow(at: indexPath, animated: true)
                }))
                self.present(alert, animated: true)
            }))
            
            self.present(alert, animated: true)

        case 2:
            let alert = UIAlertController(title: "Log Out?", message: "Are you sure that you want to log out?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
                do {
                    UserDefaults.standard.set(nil, forKey: "currentUser")
                    try Auth.auth().signOut()
                } catch {
                    let errorAlert = UIAlertController(title: "Unable to Log Out", message: "Something went wrong and we were unable to log you out. Please check your internet connection and try again.", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                    self.present(errorAlert, animated: true)
                }
                
                if let parentVC = self.tabBarController?.presentingViewController {
                    parentVC.dismiss(animated: true)
                } else {
                    let initialViewController = UIStoryboard.initialViewController(for: .login)
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { (action) in
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            self.present(alert, animated: true)
    
        default:
            return
        }
    }

}
