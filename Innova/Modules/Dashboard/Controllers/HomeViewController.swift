//
//  HomeViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit
import DropDown
import UIDrawer

struct Services {
    var sectionName: String
    var sectionData: [ServiceObject]
}

struct ServiceObject {
    var temperature: String
    var deviceName: String
    var roomName: String
    var isEnable: Bool
    var isOffline: Bool
}

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var colHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionTemp: UICollectionView!
    @IBOutlet weak var btnAddDevice: GreenBordered!
    @IBOutlet weak var btnAddRoom: GreenBackGroundPlus!
    @IBOutlet weak var servicesCollection: UICollectionView!
    var isUpArrow = true // Set this based on your condition
    var buttonText = "Casa" // Set the initial button text
    let dropDown = DropDown()
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    let temperatureData: [Services] = [
        Services(sectionName: "Salotto", sectionData : [
            ServiceObject(temperature: "22°C", deviceName: "Termostato Smart", roomName: "Salotto", isEnable: true, isOffline: false),
            ServiceObject(temperature: "23°C", deviceName: "Lampadina Smart", roomName: "Salotto", isEnable: false, isOffline: true),
            ServiceObject(temperature: "21°C", deviceName: "Altoparlante Smart", roomName: "Salotto", isEnable: true, isOffline: false),
            ServiceObject(temperature: "24°C", deviceName: "TV Smart", roomName: "Salotto", isEnable: false, isOffline: false),
            ServiceObject(temperature: "25°C", deviceName: "Condizionatore d'aria", roomName: "Salotto", isEnable: true, isOffline: true),
            ServiceObject(temperature: "20°C", deviceName: "Macchina del caffè", roomName: "Salotto", isEnable: false, isOffline: true)
        ]),
        Services(sectionName: "Cucina", sectionData: [
            ServiceObject(temperature: "25°C", deviceName: "Termostato Smart", roomName: "Cucina", isEnable: true, isOffline: false),
            ServiceObject(temperature: "24°C", deviceName: "Lampadina Smart", roomName: "Cucina", isEnable: false, isOffline: true),
            ServiceObject(temperature: "26°C", deviceName: "Altoparlante Smart", roomName: "Cucina", isEnable: true, isOffline: true),
            ServiceObject(temperature: "23°C", deviceName: "TV Smart", roomName: "Cucina", isEnable: false, isOffline: false),
            ServiceObject(temperature: "22°C", deviceName: "Forno", roomName: "Cucina", isEnable: true, isOffline: true),
            ServiceObject(temperature: "27°C", deviceName: "Frigorifero", roomName: "Cucina", isEnable: false, isOffline: true)
        ]),
        Services(sectionName: "Bagno", sectionData: [
            ServiceObject(temperature: "24°C", deviceName: "Termostato Smart", roomName: "Bagno", isEnable: true, isOffline: false),
            ServiceObject(temperature: "25°C", deviceName: "Specchio Smart", roomName: "Bagno", isEnable: false, isOffline: true),
            ServiceObject(temperature: "23°C", deviceName: "Scaldasalviette", roomName: "Bagno", isEnable: true, isOffline: false),
            ServiceObject(temperature: "26°C", deviceName: "Radio per la doccia", roomName: "Bagno", isEnable: false, isOffline: true),
            ServiceObject(temperature: "22°C", deviceName: "Spazzolino elettrico", roomName: "Bagno", isEnable: true, isOffline: true),
            ServiceObject(temperature: "21°C", deviceName: "Asciugacapelli", roomName: "Bagno", isEnable: false, isOffline: false)
        ]),
        Services(sectionName: "Casa di Mario", sectionData: [
            ServiceObject(temperature: "28°C", deviceName: "Sprinkler Smart", roomName: "Casa di Mario", isEnable: true, isOffline: true),
            ServiceObject(temperature: "27°C", deviceName: "Telecamera di sicurezza", roomName: "Casa di Mario", isEnable: false, isOffline: false),
            ServiceObject(temperature: "29°C", deviceName: "Luci esterne", roomName: "Casa di Mario", isEnable: true, isOffline: true),
            ServiceObject(temperature: "26°C", deviceName: "Scaldapatio", roomName: "Casa di Mario", isEnable: false, isOffline: true),
            ServiceObject(temperature: "30°C", deviceName: "Pompa per la piscina", roomName: "Casa di Mario", isEnable: true, isOffline: false),
            ServiceObject(temperature: "29°C", deviceName: "Tapparella Smart", roomName: "Casa di Mario", isEnable: false, isOffline: true)
        ])
    ]
    
    let data: [(imageName: String, text: String)] = [
        ("dropDown1", "Posizione non rilevata"),
        ("dropDown2", "Dispositivi attivi"),
        ("dropDown3", "Aggiungi un dispositivo"),
        ("dropDown4", "Aggiunta stanza"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionTemp.register(UINib(nibName: "DashboardTempCell", bundle: nil), forCellWithReuseIdentifier: "DashboardTempCell")
        servicesCollection.register(UINib(nibName: "HeaderSupplementaryView", bundle: nil), forCellWithReuseIdentifier: "HeaderSupplementaryView")
        self.collectionTemp?.register(UINib(nibName: "HeaderSupplementaryView", bundle: nil),forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: "HeaderSupplementaryView")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnCustomView())
        self.navigationItem.rightBarButtonItems = [self.getbarButtons(image: "gear.png", setTag: 1), self.getbarButtons(image: "plus.png", setTag: 2)]
        self.navigationController?.hideHairline()
        servicesCollection.register(UINib(nibName: "ServiceCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCell")
        btnAddRoom.touchUpInside = {
            let initiliazeVC : ActivateBluetootheController = Utilities.viewController(name: "ActivateBluetootheController", onStoryboard: "Dashboard") as! ActivateBluetootheController
            initiliazeVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(initiliazeVC, animated: true)
        }
        btnAddDevice.touchUpInside = {
            let initiliazeVC : AddDeviceController = Utilities.viewController(name: "AddDeviceController", onStoryboard: "AddDevices") as! AddDeviceController
            initiliazeVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(initiliazeVC, animated: true)

        }
    }
    override func viewWillAppear(_ animated: Bool) {
        print(UIDevice.current.modelName)

        updateContentHeight()
    }
    override func viewDidAppear(_ animated: Bool) {
        updateContentHeight()
    }
    func popupAlert() {
        showAlert(
            title: "Aggiunta stanza",
            message: "Finché non aggiungerai un dispositivo alla stanza, questa non verrà visualizzata nella tua dashboard. Potrai comunque trovarla all’interno delle impostazioni della casa.",
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
                        let initiliazeVC : AddRoomViewController = Utilities.viewController(name: "AddRoomViewController", onStoryboard: "Rooms") as! AddRoomViewController
                        initiliazeVC.hidesBottomBarWhenPushed = true
                        self.navigationController!.pushViewController(initiliazeVC, animated: true)
                        print("AddRoomViewController")
                    }
                )
            ),
            viewController: self
        )
    }
    func returnCustomView() -> UIView {
        let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 117, height: 44))
        view.layer.cornerRadius = 22.0
        view.backgroundColor = appConfig.appColors.themeColor
        let dynamicLabelText : UILabel = UILabel(frame:CGRect(x: 24, y: 0, width: 45, height: 44))
        dynamicLabelText.text = "Casa"
        dynamicLabelText.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        dynamicLabelText.textColor = UIColor.white
        let imageUpDown : UIImageView = UIImageView(frame:CGRect(x: 77, y: 8, width: 28, height: 28))
        imageUpDown.image = UIImage(named: "chevrondown")
        imageUpDown.contentMode = .scaleAspectFit
        view.addSubview(imageUpDown)
        view.addSubview(dynamicLabelText)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
        dropDown.anchorView = view // UIView or UIBarButtonItem
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)! + 16.0)
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Aggiungi una stanza", "Aggiungi un dispositivo", "Invita persone", "Aggiungi una casa"]
        dropDown.cellNib = UINib(nibName: "customDropDownCell", bundle: nil)
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? customDropDownCell else { return }
            // Setup your custom UI components
            cell.logoImageView.image = UIImage(named: "dropDown\(index+1)")
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            if index == 3 {
                self.openUpBottomSheet()
            }
        }
        dropDown.cornerRadius = 12.0
        dropDown.width = UIScreen.main.bounds.width * 0.733
        dropDown.dismissMode = .onTap
        dropDown.direction = .bottom
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().cellHeight = 44.0
        DropDown.startListeningToKeyboard()
        return view
    }
    func openUpBottomSheet(){
        let viewController = Utilities.viewController(name:"AddHouseBottomSheetViewController", onStoryboard: "Dashboard") as! AddHouseBottomSheetViewController
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true)
    }
    @objc func viewTapped() {
        print("View tapped!")
        dropDown.show()
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

    // MARK: IBActions
    @objc func btnAlertTapped(sender: UIButton) {
        if sender.tag == 0 {
            print("LeftGear")
        } else if sender.tag == 1 {
            print("RightGear")
            let initiliazeVC : HomeSettings = Utilities.viewController(name: "HomeSettings", onStoryboard: "Settings") as! HomeSettings
            initiliazeVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(initiliazeVC, animated: true)
        } else {
            print("Plus")
        }
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        if collectionView == self.servicesCollection {
            return 1
            
        } else {
            return self.temperatureData.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == self.servicesCollection {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView else {
                return HeaderSupplementaryView()
            }
            return headerView
        } else {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView else {
                return HeaderSupplementaryView()
            }
            headerView.lblSectionName.text = self.temperatureData[indexPath.section].sectionName
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            print("here you can identify which section has been tapped section Number: \(indexPath.section)")
            headerView.tag = indexPath.section
            headerView.addGestureRecognizer(tapGesture)

            return headerView
        }
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if let view = gesture.view {
            let tappedSection = view.tag
            print("here you can identify which section has been tapped section Number: \(tappedSection)")
            let resultVC = Utilities.viewController(name:"SingleRoomViewController", onStoryboard: "SingleRoom") as! SingleRoomViewController
            resultVC.temperatureData = self.temperatureData[tappedSection]
            resultVC.hidesBottomBarWhenPushed = true
            self.navigationController!.pushViewController(resultVC, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.servicesCollection {
            return self.data.count
        } else {
            return self.temperatureData[section].sectionData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.servicesCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
            cell.lblServiceName.text = self.data[indexPath.row].text
            cell.imgService.image = UIImage(named: self.data[indexPath.row].imageName)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardTempCell", for: indexPath) as! DashboardTempCell
            cell.lblTemp.text = !self.temperatureData[indexPath.section].sectionData[indexPath.row].isOffline ? self.temperatureData[indexPath.section].sectionData[indexPath.row].temperature : "--°"
            cell.lblRoomName.text = self.temperatureData[indexPath.section].sectionData[indexPath.row].roomName
            cell.lblDeviceName.text = self.temperatureData[indexPath.section].sectionData[indexPath.row].deviceName
            if self.temperatureData[indexPath.section].sectionData[indexPath.row].isEnable && !self.temperatureData[indexPath.section].sectionData[indexPath.row].isOffline {
                cell.imgBackground.image = UIImage(named: "gradientTheme")
                cell.temperatureSwitch.isHidden = false
                cell.imgOffline.isHidden = true
                cell.lblTemp.textColor = appConfig.appColors.themeColor
                cell.lblRoomName.textColor = appConfig.appColors.themeColor
                cell.lblDeviceName.textColor = appConfig.appColors.themeColor
            } else if !self.temperatureData[indexPath.section].sectionData[indexPath.row].isEnable {
                cell.imgBackground.image = UIImage(named: "gradientGray")
                cell.temperatureSwitch.isHidden = false
                cell.imgOffline.isHidden = true
                cell.lblTemp.textColor = appConfig.appColors.btnInActiveTextColor
                cell.lblRoomName.textColor = appConfig.appColors.btnInActiveTextColor
                cell.lblDeviceName.textColor = appConfig.appColors.btnInActiveTextColor
            } else {
                cell.imgBackground.image = UIImage(named: "gradientGray")
                cell.temperatureSwitch.isHidden = true
                cell.imgOffline.isHidden = false
                cell.lblTemp.textColor = appConfig.appColors.btnInActiveTextColor
                cell.lblRoomName.textColor = appConfig.appColors.btnInActiveTextColor
                cell.lblDeviceName.textColor = appConfig.appColors.btnInActiveTextColor
            }
            cell.temperatureSwitch.isOn = self.temperatureData[indexPath.section].sectionData[indexPath.row].isEnable
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.servicesCollection {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 62.0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.servicesCollection {
            let size = (self.data[indexPath.row].text as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)])
            return CGSize(width: size.width + 52.0, height: 76)
        } else {
            let width = collectionView.bounds.width
            let numberOfItemsPerRow: CGFloat = 2
            let spacing: CGFloat = flowLayout.minimumInteritemSpacing
            let availableWidth = width - spacing * (numberOfItemsPerRow)
            let itemDimension = floor(availableWidth / numberOfItemsPerRow)
            return CGSize(width: itemDimension, height: 110)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = DrawerPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.blurEffectStyle = .systemUltraThinMaterialDark
        presentationController.cornerRadius = 20
        presentationController.roundedCorners = [.topLeft, .topRight]
        presentationController.modalWidth = self.view.frame.width
        //        presentationController.topGap = self.view.frame.width
        presentationController.bounce = true
        return presentationController
    }
    func updateContentHeight() {
        self.colHeight.constant = self.collectionTemp.contentSize.height
    }
}
import UIKit


extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

