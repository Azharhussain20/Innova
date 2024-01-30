//
//  LocationAccessPermission.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class LocationAccessPermission: BaseViewController {
    
    
    @IBOutlet weak var btnCancel: PlainTextButton!
    @IBOutlet weak var btnInviteLink: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnInviteLink.isValidate = true
        self.btnInviteLink.updateButtonAppearance()
        self.configurationTitleAndBack(title: "Rilevamento posizione", imageName: "chevron.left")
        self.backTapped = {
            AppInstance._navigation.popViewController(animated: true)
        }
        self.btnInviteLink.updateButtonAppearance()
        self.addTapToDismissKeyboard()
        self.btnCancel.touchUpInside = {
            AppInstance._navigation.popViewController(animated: true)
        }
        self.btnInviteLink.touchUpInside = {
            AppInstance.gotoDashboard(transition: true)
        }
        // Do any additional setup after loading the view.
    }
}
