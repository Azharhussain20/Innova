//
//  customDropDownCell.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit
import DropDown
class customDropDownCell: DropDownCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
