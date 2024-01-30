//
//  CreateHome.swift
//  Innova
//
//  Created by Azhar Shaikh on 28/01/24.
//

import UIKit

class CreateHome: UIViewController {
    @IBOutlet weak var btnCreateHomeViaQR: PlainTextButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCreateHomeViaQR.touchUpInside = {
            let initiliazeVC : InvteByQRViewController = Utilities.viewController(name: "InvteByQRViewController", onStoryboard: "Introduction") as! InvteByQRViewController
            AppInstance._navigation.pushViewController(initiliazeVC, animated: true)
        }
    }
}
