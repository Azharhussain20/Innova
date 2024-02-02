//
//  AddDeviceViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class AddDeviceViewController:BaseViewController {
    
    @IBOutlet weak var btnScanAgain: PlainTextButton!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblDeviceList: UITableView!
    let data: [(imageName: String, text: String, subText: String)] = [
        ("DeviceIcon", "IN12345678", "Condizionatore"),
        ("DeviceIcon", "IN73826583", "Fancoil"),
        ("DeviceIcon", "IN657392945", "Condizionatore"),
        ("DeviceIcon", "IN657392945", "Fancoil"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDeviceList.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
        self.tblHeight.constant = CGFloat(self.data.count) * 57.0
        self.configurationTitleAndBack(title: "Aggiungi un dispositivo", imageName: "chevron.left")
        
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
extension AddDeviceViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DeviceCell = self.tblDeviceList.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCell
        cell.imgDeviceIcon.image = UIImage(named: self.data[indexPath.row].imageName)
        cell.lblDeviceName.text = self.data[indexPath.row].text
        cell.lblDeviceType.text = self.data[indexPath.row].subText
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.seperator.isHidden = true
        } else {
            cell.seperator.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let initiliazeVC : AddDeviceWithName = Utilities.viewController(name: "AddDeviceWithName", onStoryboard: "Device") as! AddDeviceWithName
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
}
