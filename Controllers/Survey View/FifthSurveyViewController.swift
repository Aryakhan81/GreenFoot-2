//
//  FifthSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class FifthSurveyViewController: UIViewController {
    
    //@IBOutlets
    @IBOutlet weak var entertainmentTextField: InputNumberTextField!
    @IBOutlet weak var personalCareTextField: InputNumberTextField!
    @IBOutlet weak var medicalBillTextField: InputNumberTextField!
    @IBOutlet weak var autoRepairTextField: InputNumberTextField!
    @IBOutlet weak var servicesTextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        entertainmentTextField.doneButtonPressed = {
            if self.entertainmentTextField.isFirstResponder {
                self.entertainmentTextField.resignFirstResponder()
            }
        }
        personalCareTextField.doneButtonPressed = {
            if self.personalCareTextField.isFirstResponder {
                self.personalCareTextField.resignFirstResponder()
            }
        }
        medicalBillTextField.doneButtonPressed = {
            if self.medicalBillTextField.isFirstResponder {
                self.medicalBillTextField.resignFirstResponder()
            }
        }
        autoRepairTextField.doneButtonPressed = {
            if self.autoRepairTextField.isFirstResponder {
                self.autoRepairTextField.resignFirstResponder()
            }
        }
        servicesTextField.doneButtonPressed = {
            if self.servicesTextField.isFirstResponder {
                self.servicesTextField.resignFirstResponder()
            }
        }
        
        //Style
        entertainmentTextField.layer.cornerRadius = 8
        personalCareTextField.layer.cornerRadius = 8
        medicalBillTextField.layer.cornerRadius = 8
        autoRepairTextField.layer.cornerRadius = 8
        servicesTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        guard !entertainmentTextField.isEmpty(), !entertainmentTextField.isEmpty(), !medicalBillTextField.isEmpty(), !autoRepairTextField.isEmpty(), !servicesTextField.isEmpty() else { return }
        
        info.input_footprint_shopping_goods_default_other_entertainment = Int(entertainmentTextField.text!)
        info.input_footprint_shopping_goods_default_other_personalcare = Int(entertainmentTextField.text!)
        info.input_footprint_shopping_goods_default_other_medical = Int(medicalBillTextField.text!)
        info.input_footprint_shopping_goods_default_other_autoparts = Int(autoRepairTextField.text!)
        info.input_footprint_shopping_services_total = Int(servicesTextField.text!)
        info.input_footprint_shopping_goods_total = info.input_footprint_shopping_goods_default_furnitureappliances! + info.input_footprint_shopping_goods_default_clothing! + info.input_footprint_shopping_goods_default_other_entertainment! + info.input_footprint_shopping_goods_default_other_office! + info.input_footprint_shopping_goods_default_other_personalcare! + info.input_footprint_shopping_goods_default_other_autoparts! + info.input_footprint_shopping_goods_default_other_medical!
        
        self.performSegue(withIdentifier: "to6", sender: self)
    }
    

}
