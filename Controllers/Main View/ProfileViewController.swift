//
//  ProfileViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/24/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseUI

class ProfileViewController: UIViewController, FUIAuthDelegate {
    //@IBOutlets for labels
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var carbonFootprintLabel: UILabel!
    @IBOutlet weak var reducedCarbonLabel: UILabel!
    @IBOutlet weak var starAmount: UILabel!
    
    //@IBOutlets for the describers
    @IBOutlet weak var footprintDescription: UILabel!
    @IBOutlet weak var reducedDescription: UILabel!
    @IBOutlet weak var starDescription: UILabel!
    
    //@IBOutlets for buttons
    @IBOutlet weak var retakeSurveyButton: UIButton!
    @IBOutlet weak var creditsButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        showNavigationBar(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Style
        retakeSurveyButton.layer.cornerRadius = 8
        creditsButton.layer.cornerRadius = 8
        logOutButton.layer.cornerRadius = 8
        
        if UIDevice.modelName == "iPhone 5" || UIDevice.modelName == "iPhone 5c" || UIDevice.modelName == "iPhone 5s" || UIDevice.modelName == "iPhone SE" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 16.5)
            self.reducedCarbonLabel.font = UIFont.systemFont(ofSize: 16.5)
            self.starAmount.font = UIFont.systemFont(ofSize: 16.5)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 16.5)
            self.reducedDescription.font = UIFont.boldSystemFont(ofSize: 16.5)
            self.starDescription.font = UIFont.boldSystemFont(ofSize: 16.5)
        } else if UIDevice.modelName == "iPhone 6" || UIDevice.modelName == "iPhone 6s" || UIDevice.modelName == "iPhone 7" || UIDevice.modelName == "iPhone 8" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 21)
            self.reducedCarbonLabel.font = UIFont.systemFont(ofSize: 21)
            self.starAmount.font = UIFont.systemFont(ofSize: 21)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 21)
            self.reducedDescription.font = UIFont.boldSystemFont(ofSize: 21)
            self.starDescription.font = UIFont.boldSystemFont(ofSize: 21)
        } else if UIDevice.modelName == "iPhone 6 Plus" || UIDevice.modelName == "iPhone 6s Plus" || UIDevice.modelName == "iPhone 7 Plus" || UIDevice.modelName == "iPhone 8 Plus" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 22)
            self.reducedCarbonLabel.font = UIFont.systemFont(ofSize: 22)
            self.starAmount.font = UIFont.systemFont(ofSize: 22)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 22)
            self.reducedDescription.font = UIFont.boldSystemFont(ofSize: 22)
            self.starDescription.font = UIFont.boldSystemFont(ofSize: 22)
        } else {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 20)
            self.reducedCarbonLabel.font = UIFont.systemFont(ofSize: 20)
            self.starAmount.font = UIFont.systemFont(ofSize: 20)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 20)
            self.reducedDescription.font = UIFont.boldSystemFont(ofSize: 20)
            self.starDescription.font = UIFont.boldSystemFont(ofSize: 20)

        }
        
        //Get user data...
        let userData = UserDefaults.standard.value(forKey: "currentUser") as! Data
        let user = try! JSONDecoder().decode(User.self, from: userData)
        let ref = Database.database().reference().child("users").child(user.uid)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? [String: Any]
            self.carbonFootprintLabel.text = "\((value!["carbonFootprint"] as! Double).round(to: 2)) tons/year"
            self.reducedCarbonLabel.text = "\((value!["carbonReduced"] as! Double).round(to: 2)) tons/year"
            self.starAmount.text = "\(value!["stars"] as! Int)"
        }
        
        //...and set the labels to its values!
        usernameLabel.text = user.username

    }
    
    @IBAction func retakeSurveyButtonTapped(_ sender: UIButton) {
        //Create the alert
        let alert = UIAlertController(title: "Retake Survey", message: "Are you sure that you would like to retake the survey? This will reset your current carbon footprint, carbon reduced, and star count", preferredStyle: UIAlertControllerStyle.alert)
        
        //Add the 'yes' action
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) { (action) in
            let initialViewController = UIStoryboard.initialViewController(for: .survey)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        })
        
        //Add the 'no' action
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
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
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
        
    }
    
    

}
