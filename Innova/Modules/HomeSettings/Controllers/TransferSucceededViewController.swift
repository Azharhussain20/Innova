//
//  TransferSucceededViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 13/02/24.
//

import UIKit

class TransferSucceededViewController: BaseViewController {
    @IBOutlet weak var btnConfirm: GreenThemeButton!

       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "", imageName: "chevron.left")
        self.backTapped = {
            let poppedVC = self.navigationController?.popToViewController(HomeSettings.self, animated: true)
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
