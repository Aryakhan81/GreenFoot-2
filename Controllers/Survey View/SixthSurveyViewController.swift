//
//  SixthSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class SixthSurveyViewController: UIViewController {
    
    //@IBOutlets
    @IBOutlet weak var milesVehicle1TextField: UITextField!
    @IBOutlet weak var mpgVehicle1TextField: UITextField!
    @IBOutlet weak var milesVehicle2TextField: UITextField!
    @IBOutlet weak var mpgVehicle2TextField: UITextField!
    @IBOutlet weak var milesVehicle3TextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        //Style
        milesVehicle1TextField.layer.cornerRadius = 8
        mpgVehicle1TextField.layer.cornerRadius = 8
        milesVehicle2TextField.layer.cornerRadius = 8
        mpgVehicle2TextField.layer.cornerRadius = 8
        milesVehicle3TextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if milesVehicle1TextField.text!.isEmpty || mpgVehicle1TextField.text!.isEmpty || milesVehicle2TextField.text!.isEmpty || mpgVehicle2TextField.text!.isEmpty || milesVehicle3TextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            info.input_footprint_transportation_miles1 = Int(milesVehicle1TextField.text!)
            info.input_footprint_transportation_mpg1 = Int(mpgVehicle1TextField.text!)
            info.input_footprint_transportation_miles2 = Int(milesVehicle2TextField.text!)
            info.input_footprint_transportation_mpg2 = Int(mpgVehicle2TextField.text!)
            info.input_footprint_transportation_miles3 = Int(milesVehicle3TextField.text!)
            
            self.performSegue(withIdentifier: "to7", sender: self)
        }

    }
    

}
