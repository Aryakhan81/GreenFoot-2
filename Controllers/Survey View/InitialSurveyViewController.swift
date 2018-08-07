//
//  InitialSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/26/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

var info = SurveyInfo()

class InitialSurveyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //@IBOutlets
    @IBOutlet weak var zipcodeTextField: InputNumberTextField!
    @IBOutlet weak var housePopTextField: InputNumberTextField!
    @IBOutlet weak var houseAdultsTextField: InputNumberTextField!
    @IBOutlet weak var houseChildrenTextField: InputNumberTextField!
    @IBOutlet weak var incomePickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    //Picker view controller values
    let incomePickerValues: [String] = ["< $10,000", "$10,000+", "$20,000+", "$30,000+", "$40,000+", "$50,000+", "$60,000+", "$80,000+", "$100,000+", "> $120,000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incomePickerView.delegate = self
        //Dismiss keyboard
        zipcodeTextField.doneButtonPressed = {
            if self.zipcodeTextField.isFirstResponder {
                self.zipcodeTextField.resignFirstResponder()
            }
        }
        housePopTextField.doneButtonPressed = {
            if self.housePopTextField.isFirstResponder {
                self.housePopTextField.resignFirstResponder()
            }
        }
        houseAdultsTextField.doneButtonPressed = {
            if self.houseAdultsTextField.isFirstResponder {
                self.houseAdultsTextField.resignFirstResponder()
            }
        }
        houseChildrenTextField.doneButtonPressed = {
            if self.houseChildrenTextField.isFirstResponder {
                self.houseChildrenTextField.resignFirstResponder()
            }
        }
        
        //Style
        zipcodeTextField.layer.cornerRadius = 8
        housePopTextField.layer.cornerRadius = 8
        houseAdultsTextField.layer.cornerRadius = 8
        houseChildrenTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    //Number of columns in the picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows each picker view has
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return incomePickerValues.count
    }
    
    //Values given to each row in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return incomePickerValues[row]
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard !zipcodeTextField.isEmpty(), !housePopTextField.isEmpty(), !houseAdultsTextField.isEmpty(), !houseChildrenTextField.isEmpty() else { return }
        
        info.input_location = Int(zipcodeTextField.text!)
        info.input_size = Int(housePopTextField.text!)
        info.input_footprint_household_adults = Int(houseAdultsTextField.text!)
        info.input_footprint_household_children = Int(houseChildrenTextField.text!)
        
        info.input_income = incomePickerView.selectedRow(inComponent: 0) + 2
        
        self.performSegue(withIdentifier: "to2", sender: self)
    }
    

}
