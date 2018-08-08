//
//  LoginViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/23/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import UIKit
import FirebaseUI
import FirebaseAuth
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            print(error)
        }
        
        guard let user = user else { return }
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user, writeToUserDefaults: true)
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        }
    }
}

