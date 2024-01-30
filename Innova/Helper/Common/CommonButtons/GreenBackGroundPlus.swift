//
//  GreenBorderWithPlus.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class GreenBackGroundPlus: UIButton {
    var touchUpInside:(() -> Void)?
    init() {
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    private func setupButton() {
        self.applyStyle(buttonFont: UIFont(name: "HelveticaNeue-Bold", size: 16),
                        textColor: UIColor.white,
                        cornerRadius:16.0,
                        backgroundColor:appConfig.appColors.themeColor,
                            borderColor:appConfig.appColors.themeColor,
                        borderWidth: 0.0,
                        state: .normal)
        let buttonImage = UIImage(named: "whitePlus")
        self.setImage(buttonImage, for: .normal)
        print(UIScreen.main.bounds.width - 60)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: (UIScreen.main.bounds.width - 60) - 40, bottom: 0, right: 0)
        self.tintColor = appConfig.appColors.themeColor
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc private func buttonTapped() {
        self.touchUpInside?()
    }

}
