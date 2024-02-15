//
//  TemperatureCell.swift
//  Innova
//
//  Created by Azhar - M1 on 14/02/24.
//

import UIKit

class TemperatureCell: UITableViewCell {
    
    var touchUpInsideArrow:(() -> Void)?
    var touchUpInsideTrash:(() -> Void)?
    var touchUpInsideWifi:(() -> Void)?

    
    @IBOutlet weak var temperatureSwitch: UISwitch!
    @IBOutlet weak var btnTrash: UIButton!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var btnWifi: UIButton!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var lblTemprature: UILabel!
    @IBOutlet weak var imgHamburger: UIImageView!
    @IBOutlet weak var hamburgerView: UIView!
    @IBOutlet weak var gradientImage: UIImageView!
    @IBOutlet weak var shieldView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnWifiTapped(_ sender: UIButton) {
        self.touchUpInsideWifi!()

    }
    @IBAction func btnArrowTapped(_ sender: UIButton) {
        self.touchUpInsideArrow!()

    }
    @IBAction func btnTrashTapped(_ sender: UIButton) {
        print("Trash")
        self.touchUpInsideTrash!()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
