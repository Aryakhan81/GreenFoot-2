//
//  BasicSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/13/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class BasicSurveyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let popPickerValues = ["Average", "1", "2", "3", "4", "5 or more"]
    let incomePickerValues = ["Average", "< $10,000", "$10,000+", "$20,000+", "$30,000+", "$40,000+", "$50,000+", "$60,000+", "$80,000+", "$100,000+", "> $120,000"]
    
    //Number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return popPickerValues.count
        default:
            return incomePickerValues.count
        }
    }
    
    //Title for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return popPickerValues[row]
        default:
            return incomePickerValues[row]
        }
    }
    
    @IBOutlet weak var locationTypeControl: UISegmentedControl!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var housePopPickerView: UIPickerView!
    @IBOutlet weak var incomePickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.housePopPickerView.dataSource = self
        self.housePopPickerView.delegate = self
        self.incomePickerView.dataSource = self
        self.incomePickerView.delegate = self
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        //Style
        self.locationTypeControl.layer.cornerRadius = 8
        self.locationTextField.layer.cornerRadius = 8
        self.nextButton.layer.cornerRadius = 8
    }

    @IBAction func locationTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.locationTextField.keyboardType = .numberPad
            self.locationTextField.placeholder = "Zipcode..."
        default:
            self.locationTextField.keyboardType = .default
            self.locationTextField.placeholder = "State abbv..."
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if locationTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            switch self.locationTypeControl.selectedSegmentIndex {
            case 0:
                if locationTextField.text!.count == 5 {
                    
                    basicInfo.input_location = locationTextField.text
                    basicInfo.input_location_mode = 1
                    basicInfo.input_size = housePopPickerView.selectedRow(inComponent: 0)
                    basicInfo.input_income = incomePickerView.selectedRow(inComponent: 0) + 1
                    
                    self.performSegue(withIdentifier: "toBasicResults", sender: self)
                } else {
                    let alert = UIAlertController(title: "Invalid Zipcode", message: "Please enter a valid 5-digit zipcode.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                        self.locationTextField.becomeFirstResponder()
                    }))
                    self.present(alert, animated: true)
                }
            default:
                if locationTextField.text!.count == 2 {
                    
                    basicInfo.input_location = locationTextField.text
                    basicInfo.input_location_mode = 4
                    basicInfo.input_size = housePopPickerView.selectedRow(inComponent: 0)
                    basicInfo.input_income = incomePickerView.selectedRow(inComponent: 0) + 1
                    
                    self.performSegue(withIdentifier: "toBasicResults", sender: self)
                } else {
                    let alert = UIAlertController(title: "Invalid State Abbreviation", message: "Please enter a valid 2-digit state abbreviation.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                        self.locationTextField.becomeFirstResponder()
                    }))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
