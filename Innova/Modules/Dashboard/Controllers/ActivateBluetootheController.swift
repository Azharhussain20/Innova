//
//  ActivateBluetootheController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class ActivateBluetootheController: BaseViewController {

    @IBOutlet weak var btnIgnore: PlainTextButton!
    @IBOutlet weak var btnTryAgain: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Attivazione Bluetooth", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        self.btnTryAgain.touchUpInside = {
            self.navigationController?.popViewController(animated: true)
        }
        self.btnTryAgain.touchUpInside = {
            let initiliazeVC : AddDeviceViewController = Utilities.viewController(name: "AddDeviceViewController", onStoryboard: "Device") as! AddDeviceViewController
            initiliazeVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(initiliazeVC, animated: true)
        }
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
