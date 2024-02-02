//
//  DeviceCell.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var seperator: UILabel!
    @IBOutlet weak var lblDeviceType: UILabel!
    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var imgDeviceIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
