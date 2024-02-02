//
//  DeviceAddedSuccessfully.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class DeviceAddedSuccessfully: BaseViewController {

    @IBOutlet weak var btnThankyou: GreenThemeButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "", imageName: "undo")
        self.backTapped = {
            let poppedVC = self.navigationController?.popToViewController(HomeViewController.self, animated: true)
        }
        self.btnThankyou.touchUpInside = {
            let poppedVC = self.navigationController?.popToViewController(HomeViewController.self, animated: true)
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
