//
//  SeventhSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class SeventhSurveyViewController: UIViewController {
    //@IBOutlets
    @IBOutlet weak var mpgVehicle3TextField: InputNumberTextField!
    @IBOutlet weak var milesVehicle4TextField: InputNumberTextField!
    @IBOutlet weak var mpgVehicle4TextField: InputNumberTextField!
    @IBOutlet weak var planeTravelTextField: InputNumberTextField!
    @IBOutlet weak var publicTransportTextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        mpgVehicle3TextField.doneButtonPressed = {
            if self.mpgVehicle3TextField.isFirstResponder {
                self.mpgVehicle3TextField.resignFirstResponder()
            }
        }
        milesVehicle4TextField.doneButtonPressed = {
            if self.milesVehicle4TextField.isFirstResponder {
                self.milesVehicle4TextField.resignFirstResponder()
            }
        }
        mpgVehicle4TextField.doneButtonPressed = {
            if self.mpgVehicle4TextField.isFirstResponder {
                self.mpgVehicle4TextField.resignFirstResponder()
            }
        }
        planeTravelTextField.doneButtonPressed = {
            if self.planeTravelTextField.isFirstResponder {
                self.planeTravelTextField.resignFirstResponder()
            }
        }
        publicTransportTextField.doneButtonPressed = {
            if self.publicTransportTextField.isFirstResponder {
                self.publicTransportTextField.resignFirstResponder()
            }
        }
        
        //Style
        mpgVehicle3TextField.layer.cornerRadius = 8
        milesVehicle4TextField.layer.cornerRadius = 8
        mpgVehicle4TextField.layer.cornerRadius = 8
        planeTravelTextField.layer.cornerRadius = 8
        publicTransportTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        info.input_footprint_transportation_mpg3 = Int(mpgVehicle3TextField.text!)
        info.input_footprint_transportation_miles4 = Int(milesVehicle4TextField.text!)
        info.input_footprint_transportation_mpg4 = Int(mpgVehicle4TextField.text!)
        info.input_footprint_transportation_airtotal = Int(planeTravelTextField.text!)
        info.input_footprint_transportation_publictrans = Int(publicTransportTextField.text!)
        
        self.performSegue(withIdentifier: "toLoading", sender: self)
    }
    

}
