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
    @IBOutlet weak var houseHeatingTextField: UITextField!
    @IBOutlet weak var houseCoolingTextField: UITextField!
    @IBOutlet weak var furnitureAppliancesTextField: UITextField!
    @IBOutlet weak var officeSuppliesTextField: UITextField!
    @IBOutlet weak var clothingTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        //Style
        houseHeatingTextField.layer.cornerRadius = 8
        houseCoolingTextField.layer.cornerRadius = 8
        furnitureAppliancesTextField.layer.cornerRadius = 8
        officeSuppliesTextField.layer.cornerRadius = 8
        clothingTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if houseHeatingTextField.text!.isEmpty || houseCoolingTextField.text!.isEmpty || furnitureAppliancesTextField.text!.isEmpty || officeSuppliesTextField.text!.isEmpty || clothingTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            houseHeatingTextField.checkLegnth(self, to: 6)
            houseCoolingTextField.checkLegnth(self, to: 6)
            furnitureAppliancesTextField.checkLegnth(self, to: 7)
            officeSuppliesTextField.checkLegnth(self, to: 7)
            clothingTextField.checkLegnth(self, to: 7)
            
            info.input_footprint_housing_hdd = Int(houseHeatingTextField.text!)
            info.input_footprint_housing_cdd = Int(houseCoolingTextField.text!)
            info.input_footprint_shopping_goods_default_furnitureappliances = Int(furnitureAppliancesTextField.text!)
            info.input_footprint_shopping_goods_default_other_office = Int(officeSuppliesTextField.text!)
            info.input_footprint_shopping_goods_default_clothing = Int(clothingTextField.text!)
            
            self.performSegue(withIdentifier: "to5", sender: self)
        }

    }
    
    

}
