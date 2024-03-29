//
//  PersonDetailsViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 02/02/24.
//

import UIKit

class PersonDetailsViewController: BaseViewController {

    @IBOutlet weak var btnTransferProperty: GreenBordered!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Persone", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        self.btnTransferProperty.touchUpInside = {
            let initiliazeVC : TransferPropertyViewController = Utilities.viewController(name: "TransferPropertyViewController", onStoryboard: "Settings") as! TransferPropertyViewController
            self.navigationController!.pushViewController(initiliazeVC, animated: true)

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
