//
//  HomeSettings.swift
//  Innova
//
//  Created by Azhar - M1 on 01/02/24.
//

import UIKit
import DropDown

class HomeSettings: BaseViewController {
    @IBOutlet weak var tblRoomsType: UITableView!
    @IBOutlet weak var tblPersonHeight: NSLayoutConstraint!
    @IBOutlet weak var tblPersons: UITableView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var imgSelectedOperationMode: UIImageView!
    @IBOutlet weak var lblSelectedOperationMode: UILabel!
    @IBOutlet weak var btnOperationMode: UIButton!
    @IBOutlet weak var anchorView: UIView!

    @IBOutlet weak var btnLeaveHouse: UIButton!
    @IBOutlet weak var btnDeleteHouse: UIButton!
    let dropDown = DropDown()

    let roomData: [(imageName: String, roomName: String, numberOfDevices: Int)] = [
        ("RoomIcon", "Salotto", 1),
        ("RoomIcon", "Cucina", 2),
        ("RoomIcon", "Bagno", 3),
        ("RoomIcon", "Dispositivo", 2),
    ]
    let data: [(imageName: String, text: String)] = [
        ("select", "Seleziona"),
        ("flame", "Raffrescamento"),
        ("snow", "Riscaldamento"),
    ]
    let personData: [(userName: String, userType: String, userInitials:String, Images:String)] = [
        ("Francesco Carli", "Casa", "FC", ""),
        ("Angelo Fiore", "Ufficio", "AF", ""),
        ("Mario Rossi", "Aggiungi", "MR", ""),
        ("Hazel", "Casa", "",  "InnovaOne"),
        ("Sandy", "Ufficio", "",  "InnovaTwo"),
        ("Jenis", "Aggiungi", "",  "InnovaThree"),
        ("Travis", "Casa", "",  "InnovaFour"),
        ("Gabriel", "Ufficio", "",  "InnovaFive"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Impostazioni casa", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        tblRoomsType.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
        tblPersons.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
        self.tblHeight.constant = CGFloat(self.roomData.count) * 60.0
        self.tblPersonHeight.constant = CGFloat(self.personData.count) * 60.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.configurationOperationMode()
    }
    
    func configurationOperationMode(){
        dropDown.anchorView = self.anchorView // UIView or UIBarButtonItem
        dropDown.topOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.dataSource = ["Seleziona", "Raffrescamento", "Riscaldamento"]

        // The list of items to display. Can be changed dynamically
        dropDown.cellNib = UINib(nibName: "OperationModeCell", bundle: nil)
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? OperationModeCell else { return }
            // Setup your custom UI components
            cell.imgOperationModeImage.image = UIImage(named: self.data[index].imageName)
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.btnOperationMode.setImage(UIImage(named: "chevron.down"), for: .normal)
            self.imgSelectedOperationMode.image = UIImage(named: self.data[index].imageName)
            self.lblSelectedOperationMode.text = self.data[index].text
        }
        dropDown.cancelAction = { [unowned self] in
            self.btnOperationMode.setImage(UIImage(named: "chevron.down"), for: .normal)
          }
        dropDown.cornerRadius = 12.0
        dropDown.width = self.anchorView.bounds.width
        dropDown.dismissMode = .onTap
        dropDown.direction = .any
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().cellHeight = 40.0
        DropDown.startListeningToKeyboard()
    }
    
    @IBAction func btnDeleteHouseTapped(_ sender: UIButton) {
        self.popAlert(title: "Elimina la casa", message: "Dato che sei il proprietario di questa casa, eliminando questa abitazione tutti i dati relativi ad essa verranno persi. Questa azione è irreversibile. Continuare?", secondButttonName: "Elimina casa")
    }

    @IBAction func btnLeaveHouseTapped(_ sender: UIButton) { 
        self.popAlert(title: "Lascia questa casa", message: "Dato che sei il proprietario di questa casa, eliminando questa abitazione tutti i dati relativi ad essa verranno persi. Questa azione è irreversibile. Continuare?", secondButttonName: "Lascia casa")
    }

    @IBAction func btnEditName(_ sender: UIButton) {
        let initiliazeVC : EditNameViewController = Utilities.viewController(name: "EditNameViewController", onStoryboard: "Settings") as! EditNameViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    @IBAction func btnEditPosition(_ sender: UIButton) {
        let initiliazeVC : EditPositionViewController = Utilities.viewController(name: "EditPositionViewController", onStoryboard: "Settings") as! EditPositionViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    @IBAction func btnDropDown(_ sender: UIButton) {
        self.btnOperationMode.setImage(UIImage(named: "chevron.up"), for: .normal)
        dropDown.show()
    }
    
    @IBAction func btnRearrangeRooms(_ sender: UIButton) {
        let initiliazeVC : RearrangeRoomViewController = Utilities.viewController(name: "RearrangeRoomViewController", onStoryboard: "Settings") as! RearrangeRoomViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    @IBAction func btnAddRoom(_ sender: UIButton) {
        let initiliazeVC : AddRoomViewController = Utilities.viewController(name: "AddRoomViewController", onStoryboard: "Rooms") as! AddRoomViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    func popAlert(title:String, message:String, secondButttonName:String){
        showAlert(
            title: title,
            message: message,
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
                    title: secondButttonName,
                    style: .default,
                    handler: {
                        AppInstance.gotoDashboard(transition: true)
                    }
                )
            ),
            viewController: self
        )
    }
    
}
extension HomeSettings : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tblRoomsType {
            let cell : DeviceCell = self.tblRoomsType.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCell
            cell.lblDeviceName.text = self.roomData[indexPath.row].roomName
            cell.lblDeviceType.text = "\(self.roomData[indexPath.row].numberOfDevices) dispositivo"
            cell.imgDeviceIcon.image = UIImage(named: self.roomData[indexPath.row].imageName)
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                cell.seperator.isHidden = true
            } else {
                cell.seperator.isHidden = false
            }
            return cell
        } else {
            let cell : DeviceCell = self.tblPersons.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCell
            cell.lblDeviceName.text = self.personData[indexPath.row].userName
            cell.lblDeviceType.text = self.personData[indexPath.row].userType
            if self.personData[indexPath.row].Images == "" {
                if let image = imageWithText(self.personData[indexPath.row].userInitials) {
                    cell.imgDeviceIcon.image = image
                }
            } else {
                cell.imgDeviceIcon.image = UIImage(named: self.personData[indexPath.row].Images)
            }
            cell.imgDeviceIcon.backgroundColor = appConfig.appColors.btnInActiveView
            cell.imgDeviceIcon.layer.cornerRadius = 18.0

            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                cell.seperator.isHidden = true
            } else {
                cell.seperator.isHidden = false
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblRoomsType {
            return roomData.count
        } else {
            return personData.count
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tblRoomsType {
            return 60.0
        } else {
            return 60.0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tblRoomsType {
            print("nothing happening")
        } else {
            print("PersonDetailsViewController")
            let initiliazeVC : PersonDetailsViewController = Utilities.viewController(name: "PersonDetailsViewController", onStoryboard: "Settings") as! PersonDetailsViewController
            initiliazeVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(initiliazeVC, animated: true)

        }
    }
}
func imageWithText(_ text: String) -> UIImage? {
    let size = CGSize(width: 30, height: 30) // Adjust the size as needed
    let renderer = UIGraphicsImageRenderer(size: size)

    let image = renderer.image { context in
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle,
        ]

        let attributedString = NSAttributedString(string: text, attributes: attributes)

        // Draw text in the center of the image
        let textRect = CGRect(x: 0, y: (size.height - attributedString.size().height) / 2, width: size.width, height: size.height)
        attributedString.draw(in: textRect)
    }

    return image
}
