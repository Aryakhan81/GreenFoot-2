//
//  SurveyInstructionViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/7/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

let appInfo = AppAPIID()
var info = SurveyInfo()
var basicInfo = BasicSurveyInfo()

class SurveyInstructionViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextButtonBasic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        self.nextButton.layer.cornerRadius = 8
        self.nextButtonBasic.layer.cornerRadius = 8
    }
    
    //@IBAction for both buttons, segue to next screen depends on button tag
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Collection of Information", message: "None of the information collected in the survey will be strored online; it is single-use only. Please view our privacy policy for more info", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I Agree", style: .cancel, handler: { (action) in
            if sender.tag == 0 {
                self.performSegue(withIdentifier: "startSurvey", sender: self)
            } else {
                self.performSegue(withIdentifier: "startBasicSurvey", sender: self)
            }
        }))
        alert.addAction(UIAlertAction(title: "View Privacy Policy", style: .default, handler: { (action) in
            let urlToContact = "https://www.freeprivacypolicy.com/privacy/view/deb4670728e0e6f278e50ae3899526bf"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        }))
        alert.addAction(UIAlertAction(title: "View API Used", style: .default, handler: { (action) in
            let urlToContact = "http://coolclimate.berkeley.edu"
            UIApplication.shared.open(URL(string: urlToContact)!, options: [:], completionHandler: nil)
        }))
        alert.addAction(UIAlertAction(title: "I Disagree", style: .destructive, handler: { (action) in
            let infoAlert = UIAlertController(title: "Privacy Notice", message: "You must read and agree to our privacy policy before completing the survey", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(infoAlert, animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    
    
}
