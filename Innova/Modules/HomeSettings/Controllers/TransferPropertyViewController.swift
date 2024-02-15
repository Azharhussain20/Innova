//
//  TransferPropertyViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 08/02/24.
//

import UIKit

class TransferPropertyViewController: BaseViewController {
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblSuggestions: UITableView!

    @IBOutlet weak var btnConfirm: GreenThemeButton!
    var userData: [(image: String, locationName: String, userInitials:String, isSelected:Bool)] = [
        ("InnovaOne", "Hazel", "Amministratore", false),
        ("InnovaTwo", "Sandy", "Ospite", false),
        ("InnovaThree", "Jenis", "Proprietario - Io", false),
        ("InnovaFour", "Travis", "Invito in sospeso", false),
        ("InnovaFive", "Gabriel", "Ospite", false),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: "Trasferisci proprietà", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }

        tblSuggestions.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
        self.tblHeight.constant = CGFloat(self.userData.count) * 61.0
        self.isValidate(validate: false)
        self.btnConfirm.touchUpInside = {
            self.popAlert()
        }
        // Do any additional setup after loading the view.
    }
    func popAlert(){
        showAlert(
            title: "Trasferimento proprietà",
            message: "Trasferendo la tua proprietà, il tuo ruolo passerà da proprietario ad amministratore e solo il nuovo proprietario potrà modificare il tuo nuovo ruolo. ",
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
                    title: "Continua",
                    style: .default,
                    handler: {
                        // Handle the OK button tap action
                        let initiliazeVC : TransferSucceededViewController = Utilities.viewController(name: "TransferSucceededViewController", onStoryboard: "Settings") as! TransferSucceededViewController
                        initiliazeVC.hidesBottomBarWhenPushed = true
                        self.navigationController!.pushViewController(initiliazeVC, animated: true)
                    }
                )
            ),
            viewController: self
        )
    }
    func isValidate(validate:Bool ){
        self.btnConfirm.isValidate = validate
        self.btnConfirm.updateButtonAppearance()
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
extension TransferPropertyViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DeviceCell = self.tblSuggestions.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCell
        cell.lblDeviceName.text = self.userData[indexPath.row].locationName
        cell.lblDeviceType.text = self.userData[indexPath.row].userInitials
        cell.imgDeviceIcon.image = UIImage(named: self.userData[indexPath.row].image)
        cell.imgDeviceIcon.layer.cornerRadius = 18.0
        cell.imgForward.image = UIImage(named: "checkmark")
        if userData[indexPath.row].isSelected{
            cell.imgForward.isHidden = false
        } else {
            cell.imgForward.isHidden = true
        }
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.seperator.isHidden = true
        } else {
            cell.seperator.isHidden = false
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<userData.count {
            userData[i].isSelected = false
        }
        userData[indexPath.row].isSelected = true
        self.tblSuggestions.reloadData()
        self.isValidate(validate: true)

    }
}
