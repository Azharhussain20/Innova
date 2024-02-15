//
//  AddDeviceController.swift
//  Innova
//
//  Created by Asgar Bhojani on 14/02/24.
//

import UIKit
class AddDeviceController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Aggiungi un dispositivo", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
