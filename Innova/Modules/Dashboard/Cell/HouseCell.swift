//
//  HouseCell.swift
//  Innova
//
//  Created by Azhar - M1 on 31/01/24.
//

import UIKit

class HouseCell: UITableViewCell {

    @IBOutlet weak var imgCheckMark: UIImageView!
    @IBOutlet weak var imgHouseName: UILabel!
    @IBOutlet weak var imgHouseIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
