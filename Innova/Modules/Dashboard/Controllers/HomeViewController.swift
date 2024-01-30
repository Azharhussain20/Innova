//
//  HomeViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit
import DropDown 

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnAddDevice: GreenBordered!
    @IBOutlet weak var btnAddRoom: GreenBackGroundPlus!
    @IBOutlet weak var servicesCollection: UICollectionView!
    var isUpArrow = true // Set this based on your condition
    var buttonText = "Casa" // Set the initial button text
    let dropDown = DropDown()
    let data: [(imageName: String, text: String)] = [
            ("dropDown1", "Posizione non rilevata"),
            ("dropDown2", "Dispositivi attivi"),
            ("dropDown3", "Aggiungi un dispositivo"),
            ("dropDown4", "Aggiunta stanza"),
        ]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnCustomView())
        self.navigationItem.rightBarButtonItems = [self.getbarButtons(image: "gear.png", setTag: 1), self.getbarButtons(image: "plus.png", setTag: 2)]
        self.navigationController?.hideHairline()
        servicesCollection.register(UINib(nibName: "ServiceCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCell")
        btnAddRoom.touchUpInside = {
            
        }
        btnAddDevice.touchUpInside = {
            let initiliazeVC : ActivateBluetootheController = Utilities.viewController(name: "ActivateBluetootheController", onStoryboard: "Dashboard") as! ActivateBluetootheController
            self.navigationController!.pushViewController(initiliazeVC, animated: true)

        }
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
        }
        dropDown.cornerRadius = 12.0
        DropDown.appearance().backgroundColor = UIColor.white
        DropDown.appearance().cellHeight = 44.0
        dropDown.width = UIScreen.main.bounds.width * 0.733
        dropDown.dismissMode = .onTap
        DropDown.startListeningToKeyboard()
        dropDown.direction = .bottom


        return view
    }
    @objc func viewTapped() {
          print("View tapped!")
        dropDown.show()

          // Add your custom logic here
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
        } else {
            print("Plus")
        }
//        let resultVC = Utilities.viewController(name:"CPAlertViewController", onStoryboard: "Dashboard") as! CPAlertViewController
//        resultVC.hidesBottomBarWhenPushed = false
//        self.navigationController!.pushViewController(resultVC, animated: true)
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
        cell.lblServiceName.text = self.data[indexPath.row].text
        cell.imgService.image = UIImage(named: self.data[indexPath.row].imageName)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = (self.data[indexPath.row].text as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)])
        return CGSize(width: size.width + 52.0, height: 76)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
