import UIKit

class GreenThemeButton: UIButton {
    var touchUpInside:(() -> Void)?
    var isValidate: Bool = false
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
                            textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                        cornerRadius:16.0,
                            backgroundColor:appConfig.appColors.themeColor,
                            borderColor:appConfig.appColors.themeColor,
                            borderWidth: 0,
                        state: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc private func buttonTapped() {
        self.touchUpInside?()
    }

    func updateButtonAppearance() {
        if isValidate {
            self.applyStyle(buttonFont: UIFont(name: "HelveticaNeue-Bold", size: 16),
                                textColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                            cornerRadius:16.0,
                                backgroundColor:appConfig.appColors.themeColor,
                                borderColor:appConfig.appColors.themeColor,
                                borderWidth: 0,
                            state: .normal)
        
        } else {
            self.applyStyle(buttonFont: UIFont(name: "HelveticaNeue-Bold", size: 16),
                                textColor: appConfig.appColors.btnInActiveTextColor,
                            cornerRadius:16.0,
                                backgroundColor:appConfig.appColors.btnInActiveView,
                                borderColor:appConfig.appColors.btnInActiveView,
                                borderWidth: 0,
                            state: .normal)
        }
    }
}

extension UIColor {
    convenience init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// Usage:
// let commonButton = CommonButton()
// commonButton.setTitle("Tap me", for: .normal)
// commonButton.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
// view.addSubview(commonButton)
