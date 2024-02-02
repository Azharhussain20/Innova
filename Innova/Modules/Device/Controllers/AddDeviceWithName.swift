//
//  AddDeviceWithName.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class AddDeviceWithName: BaseViewController {

    @IBOutlet weak var continueWithoutRoom: PlainTextButton!
    @IBOutlet weak var btnAssociateWithRoom: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Aggiungi un dispositivo", imageName: "chevron.left")
        self.btnAssociateWithRoom.touchUpInside = {
            
        }
        self.continueWithoutRoom.touchUpInside = {
            let initiliazeVC : DeviceAddedSuccessfully = Utilities.viewController(name: "DeviceAddedSuccessfully", onStoryboard: "Device") as! DeviceAddedSuccessfully
            self.navigationController!.pushViewController(initiliazeVC, animated: true)

        }
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }

        // Do any additional setup after loading the view.
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
