//
//  SingleRoomViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 13/02/24.
//

import UIKit
import DropDown

class SingleRoomViewController: BaseViewController {

    @IBOutlet weak var anchorDropDown: UIView!
    @IBOutlet weak var tblTemperatures: UITableView!
    let dropDown = DropDown()
    var isRoomModifies : Bool = false
    let data: [(imageName: String, text: String)] = [
        ("pencilTheme", "Modifica nome"),
        ("SettingFilter", "Modifica lista dispositivi"),
        ("trash", "Elimina stanza")
    ]
    var temperatureData: Services = Services(sectionName: "", sectionData: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurationTitleAndBack(title: temperatureData.sectionName, imageName: "chevron.left")
        self.navigationItem.rightBarButtonItems = [self.getbarButtons(image: "Menu dots.png", setTag: 0)]
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        tblTemperatures.register(UINib(nibName: "TemperatureCell", bundle: nil), forCellReuseIdentifier: "TemperatureCell")
        tblTemperatures.dragDelegate = self
        tblTemperatures.dragInteractionEnabled = true

    }
    override func viewDidAppear(_ animated: Bool) {
        self.setupDropDown()
    }
    
    func setupDropDown(){
        dropDown.anchorView = self.navigationItem.rightBarButtonItem?.plainView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)! + 16.0)
        dropDown.dataSource = ["Modifica nome", "Modifica lista dispositivi", "Elimina stanza"]
        dropDown.cellNib = UINib(nibName: "customDropDownCell", bundle: nil)
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? customDropDownCell else { return }
            // Setup your custom UI components
            cell.logoImageView.image = UIImage(named: self.data[index].imageName)
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            switch index {
            case 0:
                self.gotoNameModification()
            case 1:
                self.isRoomModifies = true
                self.tblTemperatures.reloadData()
            case 2:
                popupAlert(index: -1, title: "Elimina la stanza", Message: "Sei sicuro di voler eliminare questa stanza? \nUna volta eliminata, non potrai più ripristinarla.", buttonName: "Elimina")
            default:
                break;
            }
        }
        dropDown.cornerRadius = 12.0
        dropDown.width = UIScreen.main.bounds.width * 0.70
        dropDown.dismissMode = .onTap
        dropDown.direction = .bottom
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().cellHeight = 44.0
    }
    
    func gotoMoveDevice(){
        let initiliazeVC : MoveDeviceToRoomViewController = Utilities.viewController(name: "MoveDeviceToRoomViewController", onStoryboard: "SingleRoom") as! MoveDeviceToRoomViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    func gotoNameModification(){
        let initiliazeVC : EditNameViewController = Utilities.viewController(name: "EditNameViewController", onStoryboard: "Settings") as! EditNameViewController
        initiliazeVC.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
    func getbarButtons(image:String, setTag: Int) -> UIBarButtonItem {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: image), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(btnAlertTapped), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.tag = setTag
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }
    @objc func btnAlertTapped(sender: UIButton) {
        if sender.tag == 0 {
            print("Menu dots")
            self.dropDown.show()
        }
    }

}
extension SingleRoomViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.temperatureData.sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemperatureCell", for: indexPath) as! TemperatureCell

        cell.touchUpInsideTrash = {
            self.popupAlert(index: indexPath.row, title: "Elimina il dispositivo", Message: "Sei sicuro di voler eliminare questo dispositivo? Una volta eliminato, dovrai eseguire nuovamente la configurazione per ripristinarlo.", buttonName: "Elimina")
        }
        cell.touchUpInsideWifi = {
            print("WiFi")
        }
        cell.touchUpInsideArrow = {
            print("Arrow")
            self.gotoMoveDevice()
        }

        let item = self.temperatureData.sectionData[indexPath.row]

        cell.lblTemprature.text = !item.isOffline ? item.temperature : "--°"
        cell.lblRoomName.text = item.roomName
        cell.lblDeviceName.text = item.deviceName
       
        if item.isEnable && !item.isOffline {
            cell.gradientImage.image = UIImage(named: "tblGradientTheme")
            cell.temperatureSwitch.isHidden = false
            cell.btnWifi.isHidden = true
            cell.lblTemprature.textColor = appConfig.appColors.themeColor
            cell.lblRoomName.textColor = appConfig.appColors.themeColor
            cell.lblDeviceName.textColor = appConfig.appColors.themeColor
        } else if !item.isEnable {
            cell.gradientImage.image = UIImage(named: "tblGradientGray")
            cell.temperatureSwitch.isHidden = false
            cell.btnWifi.isHidden = true
            cell.lblTemprature.textColor = appConfig.appColors.btnInActiveTextColor
            cell.lblRoomName.textColor = appConfig.appColors.btnInActiveTextColor
            cell.lblDeviceName.textColor = appConfig.appColors.btnInActiveTextColor
        } else {
            cell.gradientImage.image = UIImage(named: "tblGradientGray")
            cell.temperatureSwitch.isHidden = true
            cell.btnWifi.isHidden = false
            cell.lblTemprature.textColor = appConfig.appColors.btnInActiveTextColor
            cell.lblRoomName.textColor = appConfig.appColors.btnInActiveTextColor
            cell.lblDeviceName.textColor = appConfig.appColors.btnInActiveTextColor
        }
        if self.isRoomModifies {
            cell.temperatureSwitch.isHidden = true
            cell.hamburgerView.isHidden = false
            cell.btnTrash.isHidden = false
            cell.btnArrow.isHidden = false
        } else {
            cell.temperatureSwitch.isHidden = false
            cell.hamburgerView.isHidden = true
            cell.btnTrash.isHidden = true
            cell.btnArrow.isHidden = true
        }
        cell.temperatureSwitch.isOn = item.isEnable
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
   
    func popupAlert(index : Int , title: String, Message:String, buttonName :String) {
        showAlert(
            title: title,
            message: Message,
            type: .twoButtons(
                button1: (
                    title: "Annulla",
                    style: .default,
                    handler: {
                        // Handle the Cancel button tap action
                        print("Annulla button tapped")
                    }
                ),
                button2: (
                    title: buttonName,
                    style: .default,
                    handler: {
                        // Handle the OK button tap action
                        if index >= 0 {
                            self.temperatureData.sectionData.remove(at: index)
                            self.isRoomModifies = false
                            self.tblTemperatures.reloadData()
                        }
                    }
                )
            ),
            viewController: self
        )
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isRoomModifies
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.temperatureData.sectionData[sourceIndexPath.row]
        self.temperatureData.sectionData.remove(at: sourceIndexPath.row)
        self.temperatureData.sectionData.insert(movedObject, at: destinationIndexPath.row)
        self.tblTemperatures.reloadData()
    }
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = self.temperatureData.sectionData[indexPath.row]
        return [ dragItem ]
    }



}
