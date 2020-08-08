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
    @IBOutlet weak var mpgVehicle3TextField: UITextField!
    @IBOutlet weak var milesVehicle4TextField: UITextField!
    @IBOutlet weak var mpgVehicle4TextField: UITextField!
    @IBOutlet weak var planeTravelTextField: UITextField!
    @IBOutlet weak var publicTransportTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        //Style
        mpgVehicle3TextField.layer.cornerRadius = 8
        milesVehicle4TextField.layer.cornerRadius = 8
        mpgVehicle4TextField.layer.cornerRadius = 8
        planeTravelTextField.layer.cornerRadius = 8
        publicTransportTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if mpgVehicle3TextField.text!.isEmpty || milesVehicle4TextField.text!.isEmpty || mpgVehicle4TextField.text!.isEmpty || planeTravelTextField.text!.isEmpty || publicTransportTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            mpgVehicle3TextField.checkLegnth(self, to: 4)
            milesVehicle4TextField.checkLegnth(self, to: 9)
            mpgVehicle4TextField.checkLegnth(self, to: 4)
            planeTravelTextField.checkLegnth(self, to: 10)
            publicTransportTextField.checkLegnth(self, to: 8)
            
            info.input_footprint_transportation_mpg3 = Int(mpgVehicle3TextField.text!)
            info.input_footprint_transportation_miles4 = Int(milesVehicle4TextField.text!)
            info.input_footprint_transportation_mpg4 = Int(mpgVehicle4TextField.text!)
            info.input_footprint_transportation_airtotal = Int(planeTravelTextField.text!)
            info.input_footprint_transportation_publictrans = Int(publicTransportTextField.text!)
            
            self.performSegue(withIdentifier: "toLoading", sender: self)
        }

    }
    
}
