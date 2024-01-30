
import UIKit

@IBDesignable
class WhiteButtonWithImage: UIButton {

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
        
        var configuration = UIButton.Configuration.plain()
        configuration.imagePlacement = .leading
        configuration.imagePadding = 16.0
        self.configuration = configuration
        self.applyStyle(buttonFont: UIFont(name: "HelveticaNeue-Bold", size: 16),
                            textColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
                        cornerRadius:16.0,
                        backgroundColor:UIColor.white,
                            borderColor:appConfig.appColors.borderColorOfButtons,
                            borderWidth: 2.0,
                        state: .normal) 
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc private func buttonTapped() {
        self.touchUpInside?()
    }
}


