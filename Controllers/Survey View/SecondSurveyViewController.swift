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
    @IBOutlet weak var meatFishEggsTextField: UITextField!
    @IBOutlet weak var dairyTextField: UITextField!
    @IBOutlet weak var fruitsVeggiesTextField: UITextField!
    @IBOutlet weak var cerealsTextField: UITextField!
    @IBOutlet weak var otherFoodsTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dismiss keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
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
            meatFishEggsTextField.checkLegnth(self, to: 7)
            dairyTextField.checkLegnth(self, to: 7)
            fruitsVeggiesTextField.checkLegnth(self, to: 7)
            cerealsTextField.checkLegnth(self, to: 7)
            otherFoodsTextField.checkLegnth(self, to: 7)
            
            info.input_footprint_shopping_food_meatfisheggs = Int(meatFishEggsTextField.text!)
            info.input_footprint_shopping_food_dairy = Int(dairyTextField.text!)
            info.input_footprint_shopping_food_fruitvegetables = Int(fruitsVeggiesTextField.text!)
            info.input_footprint_shopping_food_cereals = Int(cerealsTextField.text!)
            info.input_footprint_shopping_food_otherfood = Int(otherFoodsTextField.text!)
            
            self.performSegue(withIdentifier: "to3", sender: self)
        }

    }
    
}
