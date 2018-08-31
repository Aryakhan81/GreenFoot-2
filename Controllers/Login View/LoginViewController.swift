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
    @IBOutlet weak var actualLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        actualLoginButton.layer.cornerRadius = 8
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        presentAuth()
    }
    
    @IBAction func actualLoginButtonPressed(_ sender: UIButton) {
        presentAuth()
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            if error.localizedDescription == "Network error (such as timeout, interrupted connection or unreachable host) has occurred." {
                let alert = UIAlertController(title: "No Connection", message: "It appears that you have lost internet connetion. Please check your internet connection and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
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
    
    func presentAuth() {
        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

