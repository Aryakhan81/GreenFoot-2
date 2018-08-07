//
//  InputNumberTextField.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/27/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class InputNumberTextField: UITextField {
    var doneButtonPressed: (() -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let toolbar: UIToolbar = UIToolbar()
        
        let leadingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let trailingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped(_:)))
        toolbar.items = [leadingFlex, doneButton, trailingFlex]
        
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        doneButtonPressed?()
    }

}
