//
//  SurveyInstructionViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/7/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class SurveyInstructionViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        self.nextButton.layer.cornerRadius = 8
    }
}
