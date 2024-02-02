//
//  AddHouseBottomSheetViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 31/01/24.
//

import UIKit

class AddHouseBottomSheetViewController: BaseViewController {

    @IBOutlet weak var btnAddRoom: UIButton!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblHouse: UITableView!
    let data: [(imageName: String, text: String, isSelected: Bool)] = [
        ("OrangeHome", "Casa", true),
        ("GreenHome", "Ufficio", false),
        ("OrangeHome", "Aggiungi", false),
        ("GreenHome", "Dispositivo", false),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblHouse.register(UINib(nibName: "HouseCell", bundle: nil), forCellReuseIdentifier: "HouseCell")
        self.tblHeight.constant = CGFloat(self.data.count) * 44.0
        self.configurationTitleAndBack(title: "Aggiungi un dispositivo", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {


    }
    @IBAction func btnAddRoomTapped(_ sender: UIButton) {
        
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
extension AddHouseBottomSheetViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : HouseCell = self.tblHouse.dequeueReusableCell(withIdentifier: "HouseCell") as! HouseCell
        cell.imgHouseIcon.image = UIImage(named: self.data[indexPath.row].imageName)
        cell.imgHouseName.text = self.data[indexPath.row].text
        if self.data[indexPath.row].isSelected {
            cell.imgCheckMark.image = UIImage(named: "checkmark")
        }else {
            cell.imgCheckMark.image = nil

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let initiliazeVC : AddDeviceWithName = Utilities.viewController(name: "AddDeviceWithName", onStoryboard: "Device") as! AddDeviceWithName
        self.navigationController!.pushViewController(initiliazeVC, animated: true)
    }
    
}
