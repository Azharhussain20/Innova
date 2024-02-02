//
//  DashboardTempCell.swift
//  Innova
//
//  Created by Azhar - M1 on 31/01/24.
//

import UIKit

class DashboardTempCell: UICollectionViewCell {

    @IBOutlet weak var imgOffline: UIImageView!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var temperatureSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(){
        let layer0 = CAGradientLayer()
        layer0.colors = [
        UIColor(red: 0.891, green: 0.95, blue: 0.944, alpha: 1).cgColor,
        UIColor(red: 0.949, green: 0.98, blue: 0.976, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = container.bounds.insetBy(dx: -0.5 * container.bounds.size.width, dy: -0.5 * container.bounds.size.height)
        layer0.position = container.center
        container.layer.addSublayer(layer0)
    }
}
