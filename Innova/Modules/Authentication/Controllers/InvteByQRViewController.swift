//
//  InvteByQRViewController.swift
//  Innova
//
//  Created by Azhar Shaikh on 28/01/24.
//

import UIKit

class InvteByQRViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Fatti invitare", imageName: "chevron.left")
        self.backTapped = {
            AppInstance._navigation.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        showAlert(
            title: "Casa trovata",
            message: "L’utente Angelo Fiore ti ha invitato ad accedere alla sua casa:\n UFFICIO",
            type: .twoButtons(
                button1: (
                    title: "Annulla",
                    style: .default,
                    handler: {
                        // Handle the Cancel button tap action
                        print("Annulla button tapped")
                        AppInstance._navigation.popViewController(animated: true)
                    }
                ),
                button2: (
                    title: "Accetta",
                    style: .default,
                    handler: {
                        // Handle the OK button tap action
                        let initiliazeVC : LocationAccessPermission = Utilities.viewController(name: "LocationAccessPermission", onStoryboard: "Introduction") as! LocationAccessPermission
                        AppInstance._navigation.pushViewController(initiliazeVC, animated: true)
                        print("LocationAccessPermission")
                    }
                )
            ),
            viewController: self
        )
        
    }
}
