//
//  MoveDeviceToRoomViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 14/02/24.
//


import UIKit
import DropDown

class MoveDeviceToRoomViewController: BaseViewController {

    @IBOutlet weak var moveToAnotherRoomView: UIView!
    @IBOutlet weak var doNotPairView: UIView!
    @IBOutlet weak var colSteps: UICollectionView!
    @IBOutlet weak var moveToAnotherRooms: UISwitch!
    @IBOutlet weak var doNotPair: UISwitch!
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
        return layout
    }()
    let stepsData: [(image: String, steps: String)] = [
        ("ThemeSteps", "Device1"),
        ("ThemeSteps", "Device2"),
        ("GraySteps", "Device3"),
        ("GraySteps", "Device4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Sposta i dispositivi", imageName: "chevron.left")
        colSteps.register(UINib(nibName: "MoveStepsForDevice", bundle: nil), forCellWithReuseIdentifier: "MoveStepsForDevice")

        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func moveToAnotherRoomSwitch(_ sender: UISwitch) {
        if self.moveToAnotherRoomView.isOn {
            
        } else {
            
        }
    }
    
    
    @IBAction func doNotPairSwitch(_ sender: UISwitch) {
        
    }
}
extension MoveDeviceToRoomViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stepsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoveStepsForDevice", for: indexPath) as! MoveStepsForDevice
        cell.lblSteps.text = self.stepsData[indexPath.row].steps
        cell.imgSteps.image = UIImage(named: self.stepsData[indexPath.row].image)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 4
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: 26)
    }
}
