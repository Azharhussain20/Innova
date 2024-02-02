//
//  AddRoomViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 31/01/24.
//


import UIKit

class AddRoomViewController:BaseViewController {
    
    @IBOutlet weak var btnAdd: GreenThemeButton!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    @IBOutlet weak var tblSuggestionList: UITableView!
    let data: [(String)] = [
        ("Soggiorno"),
        ("Cucina"),
        ("Bagno"),
        ("Camera"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapToDismissKeyboard()
        tblSuggestionList.register(UINib(nibName: "SuggestionsCell", bundle: nil), forCellReuseIdentifier: "SuggestionsCell")
        self.tblHeight.constant = CGFloat(self.data.count) * 57.0
        self.configurationTitleAndBack(title: "Aggiungi una stanza", imageName: "chevron.left")
        self.backTapped = {
            self.navigationController?.popViewController(animated: true)
        }
        self.btnAdd.touchUpInside = {
            let initiliazeVC : RoomAddedSuccesfully = Utilities.viewController(name: "RoomAddedSuccesfully", onStoryboard: "Rooms") as! RoomAddedSuccesfully
            self.navigationController!.pushViewController(initiliazeVC, animated: true)
        }
    }
}
extension AddRoomViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SuggestionsCell = self.tblSuggestionList.dequeueReusableCell(withIdentifier: "SuggestionsCell") as! SuggestionsCell
        cell.lblSuggestions.text = self.data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
