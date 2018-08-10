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
    @IBOutlet weak var entertainmentTextField: UITextField!
    @IBOutlet weak var personalCareTextField: UITextField!
    @IBOutlet weak var medicalBillTextField: UITextField!
    @IBOutlet weak var autoRepairTextField: UITextField!
    @IBOutlet weak var servicesTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        //Style
        entertainmentTextField.layer.cornerRadius = 8
        personalCareTextField.layer.cornerRadius = 8
        medicalBillTextField.layer.cornerRadius = 8
        autoRepairTextField.layer.cornerRadius = 8
        servicesTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if entertainmentTextField.text!.isEmpty || personalCareTextField.text!.isEmpty || medicalBillTextField.text!.isEmpty || autoRepairTextField.text!.isEmpty || servicesTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            info.input_footprint_shopping_goods_default_other_entertainment = Int(entertainmentTextField.text!)
            info.input_footprint_shopping_goods_default_other_personalcare = Int(personalCareTextField.text!)
            info.input_footprint_shopping_goods_default_other_medical = Int(medicalBillTextField.text!)
            info.input_footprint_shopping_goods_default_other_autoparts = Int(autoRepairTextField.text!)
            info.input_footprint_shopping_services_total = Int(servicesTextField.text!)
            info.input_footprint_shopping_goods_total = info.input_footprint_shopping_goods_default_furnitureappliances! + info.input_footprint_shopping_goods_default_clothing! + info.input_footprint_shopping_goods_default_other_entertainment! + info.input_footprint_shopping_goods_default_other_office! + info.input_footprint_shopping_goods_default_other_personalcare! + info.input_footprint_shopping_goods_default_other_autoparts! + info.input_footprint_shopping_goods_default_other_medical!
            
            self.performSegue(withIdentifier: "to6", sender: self)
        }

    }
    

}
