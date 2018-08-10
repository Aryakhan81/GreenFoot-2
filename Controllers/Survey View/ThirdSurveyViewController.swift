//
//  ThirdSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/27/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class ThirdSurveyViewController: UIViewController {
    //@IBOutlets
    @IBOutlet weak var electricalBillTextField: InputNumberTextField!
    @IBOutlet weak var naturalGasBillTextField: InputNumberTextField!
    @IBOutlet weak var heatingOilBillTextField: InputNumberTextField!
    @IBOutlet weak var waterSewageBillTextField: InputNumberTextField!
    @IBOutlet weak var houseSizeTextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        electricalBillTextField.doneButtonPressed = {
            if self.electricalBillTextField.isFirstResponder {
                self.electricalBillTextField.resignFirstResponder()
            }
        }
        naturalGasBillTextField.doneButtonPressed = {
            if self.naturalGasBillTextField.isFirstResponder {
                self.naturalGasBillTextField.resignFirstResponder()
            }
        }
        heatingOilBillTextField.doneButtonPressed = {
            if self.heatingOilBillTextField.isFirstResponder {
                self.heatingOilBillTextField.resignFirstResponder()
            }
        }
        waterSewageBillTextField.doneButtonPressed = {
            if self.waterSewageBillTextField.isFirstResponder {
                self.waterSewageBillTextField.resignFirstResponder()
            }
        }
        houseSizeTextField.doneButtonPressed = {
            if self.houseSizeTextField.isFirstResponder {
                self.houseSizeTextField.resignFirstResponder()
            }
        }

        //Style
        electricalBillTextField.layer.cornerRadius = 8
        naturalGasBillTextField.layer.cornerRadius = 8
        heatingOilBillTextField.layer.cornerRadius = 8
        waterSewageBillTextField.layer.cornerRadius = 8
        houseSizeTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if electricalBillTextField.text!.isEmpty || naturalGasBillTextField.text!.isEmpty || heatingOilBillTextField.text!.isEmpty || waterSewageBillTextField.text!.isEmpty || houseSizeTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            
            info.input_footprint_housing_electricity_dollars = Int(electricalBillTextField.text!)
            info.input_footprint_housing_naturalgas_dollars = Int(naturalGasBillTextField.text!)
            info.input_footprint_housing_heatingoil_dollars = Int(heatingOilBillTextField.text!)
            info.input_footprint_housing_watersewage = Int(waterSewageBillTextField.text!)
            info.input_footprint_housing_squarefeet = Int(houseSizeTextField.text!)
            
            self.performSegue(withIdentifier: "to4", sender: self)
        }

    }

}
