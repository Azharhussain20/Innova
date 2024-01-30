//
//  ActivateBluetootheController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class ActivateBluetootheController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Attivazione Bluetooth", imageName: "chevron.left")
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
