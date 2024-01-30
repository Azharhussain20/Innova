//
//  ChangePasswordViewController.swift
//  Innova
//
//  Created by Azhar Shaikh on 26/01/24.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnCancel: PlainTextButton!
    @IBOutlet weak var btnConfirm: GreenThemeButton!
    @IBOutlet weak var txtNewPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Cambia password", imageName: "chevron.left")
        self.backTapped = {
            AppInstance._navigation.popViewController(animated: true)
        }
        
        btnCancel.touchUpInside = {
            AppInstance._navigation.popViewController(animated: true)
        }
        btnConfirm.touchUpInside = {
            AppInstance.goToLoginScreenPage(transition: true)
        }
    }
}
