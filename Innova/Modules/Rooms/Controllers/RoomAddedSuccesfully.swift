//
//  RoomAddedSuccesfully.swift
//  Innova
//
//  Created by Azhar - M1 on 31/01/24.
//

import UIKit

class RoomAddedSuccesfully: BaseViewController {

    @IBOutlet weak var btnAddDevice: GreenBackGroundPlus!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Salotto", imageName: "chevron.left")
        self.navigationItem.rightBarButtonItems = [self.getbarButtons(image: "Menu dots.png", setTag: 1)]
        self.btnAddDevice.touchUpInside = {
            let initiliazeVC : AddDeviceViewController = Utilities.viewController(name: "AddDeviceViewController", onStoryboard: "Device") as! AddDeviceViewController
            self.navigationController!.pushViewController(initiliazeVC, animated: true)
        }
        self.backTapped = {
            let poppedVC = self.navigationController?.popToViewController(HomeViewController.self, animated: true)
        }

        // Do any additional setup after loading the view.
    }
    
    func getbarButtons(image:String, setTag: Int) -> UIBarButtonItem {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: image), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(btnMenuDotsTapped), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.tag = setTag
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }
    // MARK: IBActions
    @objc func btnMenuDotsTapped(sender: UIButton) {
//        let resultVC = Utilities.viewController(name:"CPAlertViewController", onStoryboard: "Dashboard") as! CPAlertViewController
//        resultVC.hidesBottomBarWhenPushed = false
//        self.navigationController!.pushViewController(resultVC, animated: true)
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
