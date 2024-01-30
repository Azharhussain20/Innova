//
//  RegisterViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 25/01/24.
//

import UIKit
class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var vWfirstNameError: UIView!
    @IBOutlet weak var vWLastNameError: UIView!
    @IBOutlet weak var vWEmailError: UIView!
    @IBOutlet weak var vWPasswordError: UIView!
    @IBOutlet weak var vWConfirmPasswordError: UIView!
    
    @IBOutlet weak var btnLogin: PlainTextButton!
    @IBOutlet weak var btnRegistration: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnRegistration.isValidate = false
        
        self.configurationTitleAndBack(title: "Registrazione", imageName: "chevron.left")
        self.backTapped = {
            AppInstance.goToIntroDuctionPage(transition: true)
        }
        
        
        self.btnRegistration.updateButtonAppearance()
        
        self.vWfirstNameError.isHidden = true
        self.vWLastNameError.isHidden = true
        self.vWEmailError.isHidden = true
        self.vWPasswordError.isHidden = true
        self.vWConfirmPasswordError.isHidden = true
        self.addTapToDismissKeyboard()
        self.btnLogin.touchUpInside = {
            AppInstance.goToLoginScreenPage(transition: true)
        }
        self.btnRegistration.touchUpInside = {
            
        }
        // Do any additional setup after loading the view.
    }
    
}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case self.txtFirstName:
            self.btnRegistration.isValidate = false
        case self.txtLastName:
            self.btnRegistration.isValidate = false
            
        case self.txtEmail:
            self.btnRegistration.isValidate = false
            
        case self.txtPassword:
            self.btnRegistration.isValidate = false
            
        case self.txtConfirmPassword:
            self.btnRegistration.isValidate = false
            
            
        default:
            self.btnRegistration.isValidate = false
            
        }
        self.btnRegistration.updateButtonAppearance()
    }
}

