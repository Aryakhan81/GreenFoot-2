//
//  CreateUsernameViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/23/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class CreateUsernameViewController: UIViewController {
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 8
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser, let username = createUsernameTextField.text, !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            User.setCurrent(user)
            self.createUsernameTextField.resignFirstResponder()
            let initialViewController = UIStoryboard.initialViewController(for: .survey)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
    }
    
}
