//
//  SecondSurveyViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/27/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class SecondSurveyViewController: UIViewController {
    
    //@IBOutlets
    @IBOutlet weak var meatFishEggsTextField: InputNumberTextField!
    @IBOutlet weak var dairyTextField: InputNumberTextField!
    @IBOutlet weak var fruitsVeggiesTextField: InputNumberTextField!
    @IBOutlet weak var cerealsTextField: InputNumberTextField!
    @IBOutlet weak var otherFoodsTextField: InputNumberTextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        meatFishEggsTextField.doneButtonPressed = {
            if self.meatFishEggsTextField.isFirstResponder {
                self.meatFishEggsTextField.resignFirstResponder()
            }
        }
        dairyTextField.doneButtonPressed = {
            if self.dairyTextField.isFirstResponder {
                self.dairyTextField.resignFirstResponder()
            }
        }
        fruitsVeggiesTextField.doneButtonPressed = {
            if self.fruitsVeggiesTextField.isFirstResponder {
                self.fruitsVeggiesTextField.resignFirstResponder()
            }
        }
        cerealsTextField.doneButtonPressed = {
            if self.cerealsTextField.isFirstResponder {
                self.cerealsTextField.resignFirstResponder()
            }
        }
        otherFoodsTextField.doneButtonPressed = {
            if self.otherFoodsTextField.isFirstResponder {
                self.otherFoodsTextField.resignFirstResponder()
            }
        }
        
        //Style
        meatFishEggsTextField.layer.cornerRadius = 8
        dairyTextField.layer.cornerRadius = 8
        fruitsVeggiesTextField.layer.cornerRadius = 8
        cerealsTextField.layer.cornerRadius = 8
        otherFoodsTextField.layer.cornerRadius = 8
        nextButton.layer.cornerRadius = 8
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if meatFishEggsTextField.text!.isEmpty || dairyTextField.text!.isEmpty || fruitsVeggiesTextField.text!.isEmpty || cerealsTextField.text!.isEmpty || otherFoodsTextField.text!.isEmpty {
            AlertPresenterService.alertEmptyField(self)
            return
        } else {
            
            info.input_footprint_shopping_food_meatfisheggs = Int(meatFishEggsTextField.text!)
            info.input_footprint_shopping_food_dairy = Int(dairyTextField.text!)
            info.input_footprint_shopping_food_fruitvegetables = Int(fruitsVeggiesTextField.text!)
            info.input_footprint_shopping_food_cereals = Int(cerealsTextField.text!)
            info.input_footprint_shopping_food_otherfood = Int(otherFoodsTextField.text!)
            
            self.performSegue(withIdentifier: "to3", sender: self)
        }

    }
    
}
