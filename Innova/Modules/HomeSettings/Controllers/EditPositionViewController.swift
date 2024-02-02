//
//  EditPositionViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 01/02/24.
//

import UIKit

class EditPositionViewController: BaseViewController {

    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblSuggestions: UITableView!
    let suggestionsData: [(image: String, locationName: String, userInitials:String)] = [
        ("LocationArrow", "Rovereto", "TN"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Rovere' della Luna", "VR"),
        ("LocationArrow", "Roverbella", "MN")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Modifica posizione", imageName: "chevron.left")

        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        tblSuggestions.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
        self.tblHeight.constant = CGFloat(self.suggestionsData.count) * 61.0
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
extension EditPositionViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DeviceCell = self.tblSuggestions.dequeueReusableCell(withIdentifier: "DeviceCell") as! DeviceCell
        cell.lblDeviceName.text = self.suggestionsData[indexPath.row].locationName
        cell.lblDeviceType.text = self.suggestionsData[indexPath.row].userInitials
        cell.imgDeviceIcon.image = UIImage(named: self.suggestionsData[indexPath.row].image)
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.seperator.isHidden = true
        } else {
            cell.seperator.isHidden = false
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
