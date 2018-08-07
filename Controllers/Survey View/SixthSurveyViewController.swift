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
    @IBOutlet weak var milesVehicle1TextField: InputNumberTextField!
    @IBOutlet weak var mpgVehicle1TextField: InputNumberTextField!
    @IBOutlet weak var milesVehicle2TextField: InputNumberTextField!
    @IBOutlet weak var mpgVehicle2TextField: InputNumberTextField!
    @IBOutlet weak var milesVehicle3TextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        milesVehicle1TextField.doneButtonPressed = {
            if self.milesVehicle1TextField.isFirstResponder {
                self.milesVehicle1TextField.resignFirstResponder()
            }
        }
        mpgVehicle1TextField.doneButtonPressed = {
            if self.mpgVehicle1TextField.isFirstResponder {
                self.mpgVehicle1TextField.resignFirstResponder()
            }
        }
        milesVehicle2TextField.doneButtonPressed = {
            if self.milesVehicle2TextField.isFirstResponder {
                self.milesVehicle2TextField.resignFirstResponder()
            }
        }
        mpgVehicle2TextField.doneButtonPressed = {
            if self.mpgVehicle2TextField.isFirstResponder {
                self.mpgVehicle2TextField.resignFirstResponder()
            }
        }
        milesVehicle3TextField.doneButtonPressed = {
            if self.milesVehicle3TextField.isFirstResponder {
                self.milesVehicle3TextField.resignFirstResponder()
            }
        }
        
        //Style
        milesVehicle1TextField.layer.cornerRadius = 8
        mpgVehicle1TextField.layer.cornerRadius = 8
        milesVehicle2TextField.layer.cornerRadius = 8
        mpgVehicle2TextField.layer.cornerRadius = 8
        milesVehicle3TextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        guard !milesVehicle1TextField.isEmpty(), !mpgVehicle1TextField.isEmpty(), !milesVehicle2TextField.isEmpty(), !mpgVehicle2TextField.isEmpty(), !milesVehicle3TextField.isEmpty() else { return }
        
        info.input_footprint_transportation_miles1 = Int(milesVehicle1TextField.text!)
        info.input_footprint_transportation_mpg1 = Int(mpgVehicle1TextField.text!)
        info.input_footprint_transportation_miles2 = Int(milesVehicle2TextField.text!)
        info.input_footprint_transportation_mpg2 = Int(mpgVehicle2TextField.text!)
        info.input_footprint_transportation_miles3 = Int(milesVehicle3TextField.text!)
        
        self.performSegue(withIdentifier: "to7", sender: self)
    }
    

}
