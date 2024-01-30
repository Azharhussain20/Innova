//
//  ButtonValidationHelper.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit

class ButtonValidationHelper
{
    var textFields: [UITextField?]
    var buttons: [UIButton]!
    var viewBtn: UIView!
    
    
    init(textFields: [UITextField?], buttons: [UIButton], view: UIView) {
        
        self.textFields = textFields
        self.buttons = buttons
        self.viewBtn = view
        
        attachTargetsToTextFields()
        disableButtons()
        checkForEmptyFields()
    }
    init(is_enable: Bool, buttons: [UIButton], view: UIView) {
        
        self.textFields = []
        self.buttons = buttons
        self.viewBtn = view
        
        if is_enable {
            enableButtons()
        }
        else{
            disableButtons()
        }
    }
    
    func config(textFields: [UITextField?], buttons: [UIButton], view: UIView) {
        
        self.textFields = textFields
        self.buttons = buttons
        self.viewBtn = view
        
        attachTargetsToTextFields()
        disableButtons()
        checkForEmptyFields()
    }
    
    //Attach editing changed listeners to all textfields passed in
    private func attachTargetsToTextFields() {
        for textfield in textFields{
            if textfield != nil
            {
                textfield?.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
            }
        }
    }
    
    @objc private func textFieldsIsNotEmpty(sender: UITextField)
    {
        //sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        checkForEmptyFields()
    }
    
    
    //Returns true if the field is empty, false if it not
    func checkForEmptyFields() {
        
        for textField in textFields{
            if textField != nil
            {
                guard let textFieldVar = textField?.text?.trim(), !textFieldVar.isEmpty else {
                    disableButtons()
                    return
                }
            }
        }
        enableButtons()
    }
    
    private func enableButtons() {
        for button in buttons{
            button.isEnabled = true
            button.alpha = 1.0
            viewBtn.alpha = 1.0
        }
    }
    private func disableButtons() {
        for button in buttons{
            button.isEnabled = false
            button.alpha = 0.3
            viewBtn.alpha = 0.3
        }
    }
}
