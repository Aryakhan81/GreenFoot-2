//
//  FourthSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class FourthSurveyViewController: UIViewController {
    
    //@IBOutlets
    @IBOutlet weak var houseHeatingTextField: InputNumberTextField!
    @IBOutlet weak var houseCoolingTextField: InputNumberTextField!
    @IBOutlet weak var furnitureAppliancesTextField: InputNumberTextField!
    @IBOutlet weak var officeSuppliesTextField: InputNumberTextField!
    @IBOutlet weak var clothingTextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        houseHeatingTextField.doneButtonPressed = {
            if self.houseHeatingTextField.isFirstResponder {
                self.houseHeatingTextField.resignFirstResponder()
            }
        }
        houseCoolingTextField.doneButtonPressed = {
            if self.houseCoolingTextField.isFirstResponder {
                self.houseCoolingTextField.resignFirstResponder()
            }
        }
        furnitureAppliancesTextField.doneButtonPressed = {
            if self.furnitureAppliancesTextField.isFirstResponder {
                self.furnitureAppliancesTextField.resignFirstResponder()
            }
        }
        officeSuppliesTextField.doneButtonPressed = {
            if self.officeSuppliesTextField.isFirstResponder {
                self.officeSuppliesTextField.resignFirstResponder()
            }
        }
        clothingTextField.doneButtonPressed = {
            if self.clothingTextField.isFirstResponder {
                self.clothingTextField.resignFirstResponder()
            }
        }
        
        //Style
        houseHeatingTextField.layer.cornerRadius = 8
        houseCoolingTextField.layer.cornerRadius = 8
        furnitureAppliancesTextField.layer.cornerRadius = 8
        officeSuppliesTextField.layer.cornerRadius = 8
        clothingTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard !houseHeatingTextField.isEmpty(), !houseCoolingTextField.isEmpty(), !furnitureAppliancesTextField.isEmpty(), !officeSuppliesTextField.isEmpty(), !clothingTextField.isEmpty() else { return }

        
        info.input_footprint_housing_hdd = Int(houseHeatingTextField.text!)
        info.input_footprint_housing_cdd = Int(houseCoolingTextField.text!)
        info.input_footprint_shopping_goods_default_furnitureappliances = Int(furnitureAppliancesTextField.text!)
        info.input_footprint_shopping_goods_default_other_office = Int(officeSuppliesTextField.text!)
        info.input_footprint_shopping_goods_default_clothing = Int(clothingTextField.text!)
        
        self.performSegue(withIdentifier: "to5", sender: self)
    }
    
    

}
