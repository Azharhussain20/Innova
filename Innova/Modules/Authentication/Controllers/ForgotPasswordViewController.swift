//
//  ForgotPasswordViewController.swift
//  Innova
//
//  Created by Azhar Shaikh on 26/01/24.
//

import UIKit
class ForgotPasswordViewController: BaseViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var vWEmailError: UIView!
    
    @IBOutlet weak var btnCancel: PlainTextButton!
    @IBOutlet weak var btnInviteLink: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnInviteLink.isValidate = false
        self.configurationTitleAndBack(title: "Password dimenticata?", imageName: "chevron.left")
        self.backTapped = {
            AppInstance._navigation.popViewController(animated: true)
        }
        self.btnInviteLink.updateButtonAppearance()
        self.vWEmailError.isHidden = true
        self.addTapToDismissKeyboard()
        self.btnCancel.touchUpInside = {
            AppInstance._navigation.popViewController(animated: true)
        }
        self.btnInviteLink.touchUpInside = {
            let initiliazeVC : ChangePasswordViewController = Utilities.viewController(name: "ChangePasswordViewController", onStoryboard: "Introduction") as! ChangePasswordViewController
            AppInstance._navigation.pushViewController(initiliazeVC, animated: true)
        }
        // Do any additional setup after loading the view.
    }
}


