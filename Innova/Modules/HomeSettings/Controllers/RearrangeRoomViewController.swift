//
//  RearrangeRoomViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 01/02/24.
//

import UIKit

class RearrangeRoomViewController: BaseViewController {
    
    
    var roomData: [(imageName: String, roomName: String, numberOfDevices: Int)] = [
        ("RoomIcon", "Salotto", 1),
        ("RoomIcon", "Cucina", 2),
        ("RoomIcon", "Bagno", 3),
        ("RoomIcon", "Dispositivo", 2),
    ]
    @IBOutlet weak var tblRooms: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Ordina stanze", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }

        tblRooms.register(UINib(nibName: "RearrangeRoomTableCell", bundle: nil), forCellReuseIdentifier: "RearrangeRoomTableCell")
        tblRooms.dragDelegate = self
        tblRooms.dragInteractionEnabled = true

    }
}
extension RearrangeRoomViewController : UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : RearrangeRoomTableCell = self.tblRooms.dequeueReusableCell(withIdentifier: "RearrangeRoomTableCell") as! RearrangeRoomTableCell
        cell.lblDeviceName.text = self.roomData[indexPath.row].roomName
        cell.lblDeviceType.text = "\(self.roomData[indexPath.row].numberOfDevices) dispositivo"
        cell.imgDeviceIcon.image = UIImage(named: self.roomData[indexPath.row].imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.roomData[sourceIndexPath.row]
        self.roomData.remove(at: sourceIndexPath.row)
        self.roomData.insert(movedObject, at: destinationIndexPath.row)
        self.tblRooms.reloadData()
    }
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = roomData[indexPath.row]
        return [ dragItem ]
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
