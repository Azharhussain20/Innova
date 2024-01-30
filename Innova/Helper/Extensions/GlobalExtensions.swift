//
//  GlobalExtensions.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit
import Photos
import SwiftDate
import WebKit
import Kingfisher

let apde = UIApplication.shared.delegate as! AppDelegate
extension AppDelegate {
    func getVC<T:UIViewController>(type:T.Type, storyboardName:String) -> T {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        return sb.instantiateViewController(withIdentifier: T.className) as! T
    }
}
extension UIViewController {
    class var className: String {
        return NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!;
    }
}

//FIXME: - Setup: Config font style
enum FontType: String, CaseIterable
{
    
    case HelveticaNeueItalic = "HelveticaNeue-Italic"
    case HelveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    case HelveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case HelveticaNeueThin = "HelveticaNeue-Thin"
    case HelveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    case HelveticaNeueLight = "HelveticaNeue-Light"
    case HelveticaNeueLightItalic = "HelveticaNeue-LightItalic"
    case HelveticaNeueMedium = "HelveticaNeue-Medium"
    case HelveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    case HelveticaNeueBold = "HelveticaNeue-Bold"
    case HelveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    case HelveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    case HelveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    case HelveticaNeueRegular = "HelveticaNeue-Regular"
}
let arrFontsType = ["HelveticaNeue-Italic",
                    "HelveticaNeue-UltraLight",
                    "HelveticaNeue-UltraLightItalic",
                    "HelveticaNeue-Thin",
                    "HelveticaNeue-ThinItalic",
                    "HelveticaNeue-Light",
                    "HelveticaNeue-LightItalic",
                    "HelveticaNeue-Medium",
                    "HelveticaNeue-MediumItalic",
                    "HelveticaNeue-Bold",
                    "HelveticaNeue-BoldItalic",
                    "HelveticaNeue-CondensedBold",
                    "HelveticaNeue-CondensedBlack",
                    "HelveticaNeue-Regular"]
extension UINavigationController {
    func hideHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = true
        }
    }
    func restoreHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = false
        }
    }
    func findHairlineImageViewUnder(_ view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            if let imageView = self.findHairlineImageViewUnder(subview) {
                return imageView
            }
        }
        return nil
    }
}
extension UIFont
{
    class func applyHelveticaNeueRegular(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueRegular , size: fontSize)!
    }
    class func applyHelveticaNeueItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueItalic , size: fontSize)!
    }
    class func applyHelveticaNeueUltraLight(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueUltraLight , size: fontSize)!
    }
    class func applyHelveticaNeueUltraLightItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueUltraLightItalic , size: fontSize)!
    }
    class func applyHelveticaNeueThin(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueThin , size: fontSize)!
    }
    class func applyHelveticaNeueThinItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueThinItalic , size: fontSize)!
    }
    class func applyHelveticaNeueLight(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueLight , size: fontSize)!
    }
    class func applyHelveticaNeueLightItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueLightItalic , size: fontSize)!
    }
    class func applyHelveticaNeueMedium(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueMedium , size: fontSize)!
    }
    class func applyHelveticaNeueMediumItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueMediumItalic , size: fontSize)!
    }
    class func applyHelveticaNeueBold(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueBold , size: fontSize)!
    }
    class func applyHelveticaNeueBoldItalic(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueBoldItalic , size: fontSize)!
    }
    class func applyHelveticaNeueCondensedBold(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueCondensedBold , size: fontSize)!
    }
    class func applyHelveticaNeueCondensedBlack(fontSize : CGFloat) -> UIFont{
        return UIFont.init(name: appConfig.appFonts.HelveticaNeueCondensedBlack , size: fontSize)!
    }
    
    
    func configureFonts() -> UIFont {
        let _fonttype = FontType.allCases.filter{self.fontName.contains($0.rawValue)}.first
        switch _fonttype {
        case .HelveticaNeueItalic:
            return UIFont.applyHelveticaNeueItalic(fontSize: self.pointSize)
        case .HelveticaNeueUltraLight:
            return UIFont.applyHelveticaNeueUltraLight(fontSize: self.pointSize)
        case .HelveticaNeueUltraLightItalic:
            return UIFont.applyHelveticaNeueUltraLightItalic(fontSize: self.pointSize)
        case .HelveticaNeueThin:
            return UIFont.applyHelveticaNeueThin(fontSize: self.pointSize)
        case .HelveticaNeueThinItalic:
            return UIFont.applyHelveticaNeueThinItalic(fontSize: self.pointSize)
        case .HelveticaNeueLight:
            return UIFont.applyHelveticaNeueLight(fontSize: self.pointSize)
        case .HelveticaNeueLightItalic:
            return UIFont.applyHelveticaNeueLightItalic(fontSize: self.pointSize)
        case .HelveticaNeueMedium:
            return UIFont.applyHelveticaNeueMedium(fontSize: self.pointSize)
        case .HelveticaNeueMediumItalic:
            return UIFont.applyHelveticaNeueMediumItalic(fontSize: self.pointSize)
        case .HelveticaNeueBold:
            return UIFont.applyHelveticaNeueBold(fontSize: self.pointSize)
        case .HelveticaNeueBoldItalic:
            return UIFont.applyHelveticaNeueBoldItalic(fontSize: self.pointSize)
        case .HelveticaNeueCondensedBold:
            return UIFont.applyHelveticaNeueCondensedBold(fontSize: self.pointSize)
        case .HelveticaNeueCondensedBlack:
            return UIFont.applyHelveticaNeueCondensedBlack(fontSize: self.pointSize)
        default:
            return UIFont.applyHelveticaNeueRegular(fontSize: self.pointSize)
        }
    }
}
extension UILabel
{
    open override func awakeFromNib()
    {
        //self.font = self.font.configureFonts()
    }
    func applyStyle(labelFont: UIFont? = nil,
                    textColor: UIColor? = nil,
                    cornerRadius: CGFloat? = nil,
                    backgroundColor: UIColor? = nil,
                    borderColor: UIColor? = nil,
                    borderWidth: CGFloat? = 1.5,
                    alignment: NSTextAlignment = .left) {
        if cornerRadius != nil {
            self.layer.cornerRadius = cornerRadius!
        } else {
            self.layer.cornerRadius = 0
        }
        
        if borderColor != nil {
            self.layer.borderColor = borderColor?.cgColor
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
        }
        
        if backgroundColor != nil {
            self.backgroundColor = backgroundColor
        } else {
            self.backgroundColor = UIColor.clear
        }
        
        if borderWidth != nil {
            self.layer.borderWidth = borderWidth!
        } else {
            self.layer.borderWidth = 0
        }
        
        if labelFont != nil {
            self.font = labelFont
            self.setFontDynamically(labelFont!)
        } else {
            self.font = UIFont.applyHelveticaNeueRegular(fontSize: 14)
            self.setFontDynamically(UIFont.applyHelveticaNeueRegular(fontSize: 14))
        }
        
        if textColor != nil {
            self.textColor = textColor
        } else {
            self.textColor = UIColor.white
        }
        
        self.textAlignment = alignment
    }
    
    func setAttributedString(_ arrStr : [String] , attributes : [[NSAttributedString.Key : Any]]) {
        let str = self.text!
        let attributedString = NSMutableAttributedString(string: str, attributes: [NSAttributedString.Key.font: self.font as Any])
        for index in 0...arrStr.count - 1 {
            let attr = attributes[index]
            attributedString.addAttributes(attr, range: (str as NSString).range(of: arrStr[index]))
        }
        self.attributedText = attributedString
    }
    
    func setFontDynamically(_ fontToSet : UIFont) {
        self.font = UIFontMetrics.default.scaledFont(for: fontToSet)
        self.adjustsFontForContentSizeCategory = true
    }
    
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    func setValue(msg: String)
    {
        DispatchQueue.main.async {
            self.text = msg
        }
    }
}

private var kAssociationKeyMaxLength: Int = 0 //Used in maxLength for TextField
extension UITextField
{
    open override func awakeFromNib()
    {}
    
    ///* TextField Max Length Settings -
    /// --------------------------
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
              prospectiveText.count > maxLength
        else {
            return
        }
        let selection = selectedTextRange
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        
        selectedTextRange = selection
    }
    
    ///* DatePicker extenstion TextField -
    /// --------------------------
    func setInputViewDatePicker(target: Any, selector: Selector, maximumDate: Date? = Date(), minimumDate: Date? = Date(), selectedDate: Date? = nil, datePickerMode: UIDatePicker.Mode = .date) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = datePickerMode
        datePicker.maximumDate = maximumDate
        datePicker.minimumDate = minimumDate
        datePicker.timeZone = TimeZone(abbreviation: "UTC")
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        
        if selectedDate != nil
        {
            datePicker.setDate(selectedDate ?? Date(), animated: false)
        }
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar
    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
    ///* Textfield extenstion TextField -
    /// --------------------------
    @IBInspectable var isRequired : Bool {
        set(value){
            if value
            {
                self.placeholder?.append("*")
            }
        }
        get {
            return self.isRequired
        }
    }
}
extension UITextView
{
    open override func awakeFromNib()
    {
        let fontProperty = self.font
        
        let _fonttype =  arrFontsType.filter{fontProperty?.fontName.contains($0) ?? false}.first
        
        
        let objFontEnum = FontType(rawValue: _fonttype ?? FontType.HelveticaNeueRegular.rawValue)
        
        switch objFontEnum {
        
        case .HelveticaNeueItalic:
            self.font = UIFont.applyHelveticaNeueItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueUltraLight:
            self.font = UIFont.applyHelveticaNeueUltraLight(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueUltraLightItalic:
            self.font = UIFont.applyHelveticaNeueUltraLightItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueThin:
            self.font = UIFont.applyHelveticaNeueThin(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueThinItalic:
            self.font = UIFont.applyHelveticaNeueThinItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueLight:
            self.font = UIFont.applyHelveticaNeueLight(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueLightItalic:
            self.font = UIFont.applyHelveticaNeueLightItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueMedium:
            self.font = UIFont.applyHelveticaNeueMedium(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueMediumItalic:
            self.font = UIFont.applyHelveticaNeueMediumItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueBold:
            self.font = UIFont.applyHelveticaNeueBold(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueBoldItalic:
            self.font = UIFont.applyHelveticaNeueBoldItalic(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueCondensedBold:
            self.font = UIFont.applyHelveticaNeueCondensedBold(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueCondensedBlack:
            self.font = UIFont.applyHelveticaNeueCondensedBlack(fontSize: fontProperty?.pointSize ?? 14)
        case .HelveticaNeueRegular:
            self.font = UIFont.applyHelveticaNeueRegular(fontSize: fontProperty?.pointSize ?? 14)
        default:
            self.font = UIFont.applyHelveticaNeueRegular(fontSize: fontProperty?.pointSize ?? 14)
        }    }
}
extension UIButton
{
    open override func awakeFromNib()
    {}
    
    func applyStyle(buttonFont: UIFont? = nil,
                    textColor: UIColor? = nil,
                    cornerRadius: CGFloat? = nil,
                    backgroundColor: UIColor? = nil,
                    borderColor: UIColor? = nil,
                    borderWidth: CGFloat? = 1.5,
                    state: UIControl.State = .normal) {
        
        if cornerRadius != nil {
            self.layer.cornerRadius = cornerRadius!
        } else {
            self.layer.cornerRadius = 0
        }
        
        if borderColor != nil {
            self.layer.borderColor = borderColor?.cgColor
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
        }
        
        if backgroundColor != nil {
            self.backgroundColor = backgroundColor
        } else {
            self.backgroundColor = UIColor.clear
        }
        
        if borderWidth != nil {
            self.layer.borderWidth = borderWidth!
        } else {
            self.layer.borderWidth = 0
        }
        
        if buttonFont != nil {
            self.titleLabel?.font =  buttonFont!
            self.titleLabel?.setFontDynamically(buttonFont!)
        } else {
            self.titleLabel?.font = UIFont.applyHelveticaNeueRegular(fontSize: 14)
            self.titleLabel?.setFontDynamically(UIFont.applyHelveticaNeueRegular(fontSize: 14))
        }
        
        if textColor != nil {
            self.setTitleColor(textColor, for: state)
        } else {
            self.setTitleColor(UIColor.white, for: state)
        }
    }
    
    @IBInspectable var isActive : Bool {
        set(value){ if value {
            guard let superView = self.superview else{return}
            self.isEnabled = true
            superView.backgroundColor = appConfig.appColors.btnActiveView
            self.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            guard let superView = self.superview else{return}
            self.isEnabled = false
            superView.backgroundColor = appConfig.appColors.btnInActiveView
            self.setTitleColor(appConfig.appColors.btnInActiveTextColor, for: .normal)
            superView.borderWidth = 1
            superView.borderColor = appConfig.appColors.btnInActiveViewBorderColor
        }
        }
        get {return self.isEnabled}
    }
    
    func pulseAnimation()
    {
        let animatedImage = UIImageView(image: self.image(for: UIControl.State.normal))
        animatedImage.frame = (self.imageView?.frame)!
        self.addSubview(animatedImage)
        UIView.animate(withDuration: 0.5, animations: {
            animatedImage.transform = animatedImage.transform.scaledBy(x: 3.5, y: 3.5)
            animatedImage.alpha = 0.0
        }, completion: {
            x in
            //animatedImage.removeFromSuperview()
        })
    }
    
    private class Action {
        var action: (UIButton) -> Void
    
        init(action: @escaping (UIButton) -> Void) {
            self.action = action
        }
    }

    private struct AssociatedKeys {
        static var ActionTapped = "actionTapped"
    }

    private var tapAction: Action? {
        set { objc_setAssociatedObject(self, &AssociatedKeys.ActionTapped, newValue, .OBJC_ASSOCIATION_RETAIN) }
        get { return objc_getAssociatedObject(self, &AssociatedKeys.ActionTapped) as? Action }
    }


    @objc dynamic private func handleAction(_ recognizer: UIButton) {
        tapAction?.action(recognizer)
    }

    func pb_addTapHandler(action: @escaping (UIButton) -> Void) {
        self.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        tapAction = Action(action: action)

    }
}
extension UINavigationController {
    open override func awakeFromNib() {
        //self.navigationBar.prefersLargeTitles = true
        //self.navigationItem.largeTitleDisplayMode = .always
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func popToViewController<T: UIViewController>(withType type: T.Type) -> Bool
    {
        var isPoped: Bool = false
        for viewController in self.viewControllers
        {
            if viewController is T
            {
                self.popToViewController(viewController, animated: true)
                isPoped = true
                break
            }
        }
        return isPoped
    }
    func popViewControllers(viewsToPop: Int, animated: Bool = true) -> Bool
    {
        var isPoped: Bool = false
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
            isPoped = true
        }
        return isPoped
    }
    func push(_ viewController: UIViewController,animated: Bool = true)
    {
        DispatchQueue.main.async {
            self.pushViewController(viewController, animated: animated)
        }
    }
    func pop(animated: Bool = true)
    {
        DispatchQueue.main.async {
            self.popViewController(animated: animated)
        }
    }
}

extension UINavigationBar
{
    open override func awakeFromNib()
    {
        setNavigation()
    }
    func setNavigation()
    {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground() //configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font : UIFont.applyHelveticaNeueBold(fontSize: 18) , NSAttributedString.Key.foregroundColor : appConfig.appColors.navTextTitleColor]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: appConfig.appColors.navTextTitleColor]
            navBarAppearance.backgroundColor = UIColor.white
            
            self.barTintColor = UIColor.white
            
            self.standardAppearance = navBarAppearance
            self.scrollEdgeAppearance = navBarAppearance
        }
        else
        {
            self.barTintColor = UIColor.white
            self.backgroundColor = UIColor.white
            
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            
            self.isOpaque = true
            self.tintColor = appConfig.appColors.navTextTitleColor
            self.titleTextAttributes = [NSAttributedString.Key.font : UIFont.applyHelveticaNeueBold(fontSize: 18) , NSAttributedString.Key.foregroundColor : appConfig.appColors.navTextTitleColor]
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.clear.cgColor
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowRadius = 0
            setBackgroundColor(UIColor.white)
            shouldRemoveShadow(true)
        }
        //self.semanticContentAttribute = apde.isArabic() ? .forceRightToLeft : .forceLeftToRight
    }
    /*func setupNavigation()
     {
     self.barTintColor = appConfig.appColors.navBarAttributeColor
     self.backgroundColor = UIColor.white
     //self.setBackgroundImage(UIImage(named: appConfig.navBarBgImage), for: UIBarMetrics.default)
     self.shadowImage = UIImage()
     //self.isTranslucent = false
     //self.clipsToBounds = false
     self.isOpaque = true
     self.tintColor = appConfig.appColors.navBarAttributeColor
     self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: appConfig.appColors.navBarAttributeColor]
     
     self.layer.masksToBounds = false
     self.layer.shadowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1).cgColor
     self.layer.shadowOpacity = 1
     self.layer.shadowOffset = CGSize(width: 0, height: 1)
     self.layer.shadowRadius = 0
     setBackgroundColor(appConfig.appColors.navBarBgColor)
     shouldRemoveShadow(false)
     }*/
    func setupWhiteNavigation()
    {
        self.barTintColor = appConfig.appColors.navBarAttributeColor
        self.backgroundColor = UIColor.white
        
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.shadowImage = UIImage()
        //self.isTranslucent = false
        //self.clipsToBounds = false
        self.isOpaque = true
        self.tintColor = appConfig.appColors.textEnableColor
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: appConfig.appColors.textEnableColor]
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = appConfig.appColors.navBarAttributeColor.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 0
        setBackgroundColor(appConfig.appColors.navBarAttributeColor)
        shouldRemoveShadow(false)
    }
    
    func shouldRemoveShadow(_ value: Bool) {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
    
    func setBackgroundColor(_ color: UIColor)
    {
        if self.accessibilityIdentifier != "detail"
        {
            self.barTintColor = color
            self.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
        }
        else
        {
            self.barTintColor = .clear
            self.backgroundColor = .clear
            UIApplication.shared.statusBarView?.backgroundColor = .clear
        }
    }
}

extension UIApplication
{
    /*var statusBarView: UIView?
     {
     if responds(to: Selector(("statusBar")))
     {
     return value(forKey: "statusBar") as? UIView
     }
     return nil
     }*/
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
            //statusBar.frame = UIApplication.shared.statusBarFrame
            //statusBar.accessibilityIdentifier = "statusBarView"
            //statusBar.backgroundColor = UIColor.clear
            UIApplication.shared.keyWindow?.addSubview(statusBar)
            return statusBar
        } else {
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            //statusBar.backgroundColor = UIColor.clear
            return statusBar
        }
    }
}

extension UIBarButtonItem
{
    open override func awakeFromNib()
    {
        
//        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: appConfig.appColors.navBarAttributeColor], for: UIControl.State.normal)
        //self.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.applyRegular(fontSize: 16), NSAttributedString.Key.foregroundColor: appConfig.appColors.navBarAttributeColor], for: UIControl.State.normal)
//        self.tintColor = appConfig.appColors.navBarAttributeColor//UIColor.black
    }
}

@IBDesignable extension UIView
{
    
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    
    @IBInspectable var shadowColor: UIColor?
    {
        set
        {
            layer.shadowColor = newValue!.cgColor
        }
        get
        {
            if let color = layer.shadowColor
            {
                return UIColor.init(cgColor: color)
            }
            else
            {
                return nil
            }
        }
    }
    
    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */
    @IBInspectable var shadowOpacity: Float
    {
        set
        {
            layer.shadowOpacity = newValue
        }
        get
        {
            return layer.shadowOpacity
        }
    }
    
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    @IBInspectable var shadowOffset: CGPoint
    {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    @IBInspectable var shadowRadius: CGFloat
    {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    @IBInspectable var borderWidth: CGFloat
    {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    @IBInspectable var borderColor: UIColor
    {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    @IBInspectable var Radius: CGFloat
    {
        get{return self.layer.cornerRadius}
        set(newValue)
        {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
    
    func setViewShadow()
    {
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1
        self.layer.masksToBounds =  false
    }
    
    @IBInspectable var ApplyViewShadow : Bool {
        set(value){ if value {setViewShadow()}}
        get{return false}
    }
}

extension UIView
{
    func showToastWithMessgae(message:String, title:String? = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String)  {
    }
    
    func setShadow()
    {
        self.layer.masksToBounds = false
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        self.layer.shadowRadius = 2
        //view.layer.cornerRadius = 5
        self.layer.shadowOpacity = 1.0
        self.layer.shadowPath = shadowPath.cgPath
        
    }
    
    /// UIView Top | Bottom | Left | Right Animation
    enum viewAnimationDirection : String {
        case Up = "up"
        case Down = "down"
        case Left = "left"
        case Right = "right"
    }
    func viewDirectAnimation(directionFrom : viewAnimationDirection)
    {
        let Duration: TimeInterval = TimeInterval(exactly: 1)!
        //self.alpha = 0.0
        switch directionFrom
        {
        case .Up:
            
            self.frame.origin.y = UIScreen.main.bounds.origin.y
            UIView.animate(withDuration: Duration)
            {
                self.frame.origin.y =  (UIScreen.main.bounds.size.height - self.frame.size.height) / 2
                self.alpha = 1.0
            }
        case .Down:
            self.frame.origin.y = UIScreen.main.bounds.size.height
            UIView.animate(withDuration: Duration)
            {
                self.frame.origin.y =  (UIScreen.main.bounds.size.height - self.frame.size.height) / 2
                self.alpha = 1.0
            }
        case .Left:
            self.frame.origin.x = UIScreen.main.bounds.origin.x
            UIView.animate(withDuration: Duration)
            {
                self.frame.origin.x =  (UIScreen.main.bounds.size.width - self.frame.size.width) / 2
                self.alpha = 1.0
            }
        case .Right:
            self.frame.origin.x = UIScreen.main.bounds.size.width
            UIView.animate(withDuration: Duration)
            {
                self.frame.origin.x =  (UIScreen.main.bounds.size.width - self.frame.size.width) / 2
                self.alpha = 1.0
            }
        }
    }
    
    /// Bounce Animation
    func bounceAnimation() {
        self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        
        UIView.animate(withDuration: 0.3 / 1.5, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }) { finished in
            UIView.animate(withDuration: 0.3 / 2, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }) { finished in
                UIView.animate(withDuration: 0.3 / 2, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    /// Get Blur View
    func setBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        //blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.opacity = 0.97
        //blurEffectView.layer.masksToBounds = true
        
        if let blurFilter = CIFilter(name: "CIGaussianBlur", parameters: [kCIInputRadiusKey: 2]) {
            blurEffectView.layer.backgroundFilters = [blurFilter]
        }
        
        //blurEffectView.alpha = 0.97
        //blurEffectView.backgroundColor = .white
        self.insertSubview(blurEffectView, at: 0)
        //view.layer.opacity = 0.5
        //view.layer.masksToBounds = true
    }
    /// Add Blur effect from UIView
    func addBlurEffect()
    {
        removeBlurEffect()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    /// Remove UIBlurEffect from UIView
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}

extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage?
    {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    func imageWithColorNew(color: UIColor) -> UIImage
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    func resizedImage(withMinimumSize size: CGSize) -> UIImage? {
        
        guard let imgRef = cgImageWithCorrectOrientation() else {return nil}
        let original_width = CGFloat(imgRef.width)
        let original_height = CGFloat(imgRef.height)
        
        let width_ratio: CGFloat = size.width / original_width
        let height_ratio: CGFloat = size.height / original_height
        
        let scale_ratio: CGFloat = width_ratio > height_ratio ? width_ratio : height_ratio
        
        return drawImage(inBounds: CGRect(x: 0, y: 0, width: CGFloat(round(Double(original_width * scale_ratio))), height: CGFloat(round(Double(original_height * scale_ratio)))))
    }
    func cgImageWithCorrectOrientation() -> CGImage?
    {
        
        if imageOrientation == .down {
            //retaining because caller expects to own the reference
            let cgImage = self.cgImage
            return cgImage
        }
        
        UIGraphicsBeginImageContextWithOptions(size, _: false, _: 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        if imageOrientation == .right {
            context?.rotate(by: 90 * .pi / 180)
        } else if imageOrientation == .left {
            context?.rotate(by: -90 * .pi / 180)
        } else if imageOrientation == .up {
            context?.rotate(by: 180 * .pi / 180)
        }
        draw(at: CGPoint(x: 0, y: 0))
        let cgImage = context?.makeImage()
        UIGraphicsEndImageContext()
        return cgImage
    }
    func drawImage(inBounds bounds: CGRect) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(bounds.size, _: false, _: 0.0)
        //let context = UIGraphicsGetCurrentContext()
        draw(in: bounds)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    var base64String: String {
        let imageData = self.resizedImage(withMinimumSize: CGSize(width: 200, height: 200))?.jpegData(compressionQuality: 0.6) //self.pngData()
        
        let dataObj = imageData?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters) ?? ""
        return Data(base64Encoded: dataObj, options: .ignoreUnknownCharacters)?.base64EncodedString() ?? ""
    }
    class func getImageFromBase64(base64: String?) -> UIImage? {
        
        if base64.isNilOrEmpty {
            return nil
        }
        
        if UIImageView.isStringLink(string: base64.toString) {
            if let url = URL(string: base64.toString) {
                if let data = try? Data.init(contentsOf: url) {
                    return UIImage.init(data: data)
                }
            }
        } else {
            if let decodedData = Data(base64Encoded: base64 ?? "", options: .ignoreUnknownCharacters) {
                return UIImage(data: decodedData)
            }
        }
        return nil
    }
    
    public enum DataUnits: String {
        case byte, kilobyte, megabyte, gigabyte
    }

    func getSizeIn(_ type: DataUnits)-> (Double,String) {
        guard let data = self.pngData() else {
            return (0.0,"")
        }
        var size: Double = 0.0

        switch type {
        case .byte:
            size = Double(data.count)
        case .kilobyte:
            size = Double(data.count) / 1024
        case .megabyte:
            size = Double(data.count) / 1024 / 1024
        case .gigabyte:
            size = Double(data.count) / 1024 / 1024 / 1024
        }
        return (size,String(format: "%.2f", size))
    }
}

// set image methods added for YMeet App so developers need to replace this methods with kingfishers methods
extension UIImageView
{
    override open func awakeFromNib()
    {
        super.awakeFromNib()
        tintColorDidChange()
    }
    
    func setImage(url: String?, placeHolder: UIImage?, maskEnable: Bool = true) {
        guard let urlStr = url, !urlStr.isEmpty else {
            self.image = placeHolder
            self.contentMode = .center
            return
        }
        
        self.kf.setImage(
            with: URL(string: urlStr),
            placeholder: placeHolder,
            options: [.transition(.fade(1)), .cacheOriginalImage],
            progressBlock: { receivedSize, totalSize in
                //print(" \(receivedSize)/\(totalSize)")
            },
            completionHandler: { result in
                //print(result)
                //print("Finished")
            })
        
        if maskEnable { setImageViewMask()}
    }
    func setImageFromBase64(base64: String?, placeHolder: UIImage?, maskEnable : Bool = true) {
        if base64.isNilOrEmpty {
            self.image = placeHolder
            self.contentMode = .center
            return
        }
        
        if UIImageView.isStringLink(string: base64.toString) {
            self.kf.setImage(
                with: URL(string: base64.toString),
                placeholder: placeHolder,
                options: [.transition(.fade(1)), .cacheOriginalImage],
                progressBlock: { receivedSize, totalSize in
                    //print(" \(receivedSize)/\(totalSize)")
                },
                completionHandler: { result in
                    //print(result)
                    //print("Finished")
                })
            
            if maskEnable { setImageViewMask()}
            
        }
        else {
            if let decodedData = Data(base64Encoded: base64 ?? "", options: .ignoreUnknownCharacters) {
                self.image = UIImage(data: decodedData)
                if maskEnable { setImageViewMask()}
            } else {
                self.image = placeHolder
                self.contentMode = .center
            }
        }
    }
    class func isStringLink(string: String) -> Bool {
        let types: NSTextCheckingResult.CheckingType = [.link]
        let detector = try? NSDataDetector(types: types.rawValue)
        guard (detector != nil && string.count > 0) else { return false }
        if detector!.numberOfMatches(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, string.count)) > 0 {
            return true
        }
        return false
    }
    
    func setImageViewMask() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    @IBInspectable var setImageMask : Bool {
        set(value){ if value {setImageViewMask()}}
        get{return self.clipsToBounds}
    }
    func startAnimate()
    {
        UIView.animate(withDuration: -1, delay: 0.0, options: .curveLinear, animations: {
            self.transform = self.transform.rotated(by: .pi)
        }) { finished in
            self.startAnimate()
        }
    }
    func generateImageForInitials(_ firstname : String , lastname : String , backColor : UIColor, textColor : UIColor)
    {
        let lblNameInitialize = UILabel()
        lblNameInitialize.frame = self.frame
        lblNameInitialize.textColor = textColor
        lblNameInitialize.text = firstname + lastname
        lblNameInitialize.textAlignment = NSTextAlignment.center
        lblNameInitialize.backgroundColor = backColor
        lblNameInitialize.layer.cornerRadius = self.frame.size.width / 2
        
        UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
        lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}

extension UIScrollView {
    var currentPage: Int {
        return Int((self.contentOffset.x + (0.5*self.frame.size.width))/self.frame.width)+1
    }
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}

extension Optional where Wrapped == String {
    var toString: String {
        return self?.trim() ?? ""
    }
    var toInt: Int {
        return Int(self ?? "0") ?? 0
    }
    var isNilOrEmpty: Bool {
        return self?.trim().isEmpty ?? true
    }
    var removeBase64Text: String {
        return self?.replacingOccurrences(of: "data:image/png;base64, ", with: "") ?? ""
    }
}
extension Optional where Wrapped == Int {
    var toString: String {
        return self?.description.trim() ?? ""
    }
    var toInt: Int {
        return self ?? 0
    }
    var isNilOrEmpty: Bool {
        return self.toString.isEmpty
    }
    var toPoBoxValue: String {
        return self == 0 ? "" : self?.description.trim() ?? ""
    }
}
extension Optional where Wrapped == Double {
    var toString: String {
        return self?.description.trim() ?? ""
    }
    var toDouble: Double {
        return self ?? 0.0
    }
    var isNilOrEmpty: Bool {
        return self.toString.isEmpty
    }
}
extension Optional where Wrapped == Bool {
    var toBool: Bool {
        return self ?? false
    }
}

extension String
{
    static let empty = String()
    
    var first: String {
        return String(prefix(1))
    }
    var last: String {
        return String(suffix(1))
    }
    
    var uppercaseFirst: String {
        return first.uppercased() + String(dropFirst())
    }
    
    /**
     :name:    trim
     */
    public func trim() -> String {
        return trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    func sizeForWidth(width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude, font: UIFont) -> CGSize {
        let attr = [NSAttributedString.Key.font: font]
        
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: height), options:.usesLineFragmentOrigin, attributes: attr, context: nil)
        return rect.size //CGSize(width: _width, height: ceil(height))
    }
    var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        get {
            return (self as NSString).deletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension
        }
    }
    var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents
        }
    }
    func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    func stringByAppendingPathExtension(ext: String) -> String? {
        let nsSt = self as NSString
        return nsSt.appendingPathExtension(ext)
    }
    func containsWhiteSpace() -> Bool {
        
        // check if there's a range for a whitespace
        let range = self.rangeOfCharacter(from: .whitespaces)
        
        // returns false when there's no range for whitespace
        if let _ = range {
            return true
        } else {
            return false
        }
    }
    ///Added by Shahabuddin - 12-12-2018
    func trimMobile() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    func setFormattedMobile() -> String {
        return self.chunk(n: 3)
            .map{ String($0) }.joined(separator: " ")
    }
    func setDefaultVal() -> String {
        return self.trim() == "" ? "..." : self
    }
    func removeDefaultVal() -> String {
        return self.trim() == "..." ? "" : self
    }
    func setBetteryPerc() -> String {
        return self.trim() == "" ? "0%" : "\(self)%"
    }
    func setOrderIdVal() -> String {
        return self.trim() == "" ? "..." : "VT\(self)"
    }
    func setQuantityVal() -> String {
        return self.trim() == "" ? "..." : "Qty: \(self)"
    }
    func setPriceVal() -> String {
        return self.trim() == "" ? "..." : "KSh \(self)"
    }
    func setLikeVal() -> String {
        return self.trim() == "" ? "..." : "\(self) likes"
    }
    func setCommentVal() -> String {
        return self.trim() == "" ? "..." : "\(self) comments"
    }
    func setNAVal() -> String {
        return self.trim() == "" ? "N/A" : self
    }
    func setPriceFormattedVal() -> String {
        let largeNumber = self
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return self.trim() == "" ? "..." : "\(numberFormatter.string(for: largeNumber) ?? "0")"
        //return self.trim() == "" ? "..." : "KSh \(self)"
    }
    func setDiscountVal() -> String {
        return self.trim() == "" ? "..." : "\(self)% Discount"
    }
    func setNoDescriptionVal() -> String {
        return self.trim() == "" ? "No Description" : self
    }
    func setCountryCodeVal() -> String {
        if self.trim() != "" {
            return self.trim().starts(with: "+") ? self : "+\(self)"
        }
        return ""
    }
    func getCountryCodeVal() -> String {
        if self.trim() != "" {
            return self.trim().starts(with: "+") ? String(self.trim().dropFirst()) : self
        }
        return ""
    }
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    func setStrikeText() -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    func setHtmlText() -> NSAttributedString {
        return try! NSAttributedString(data: self.data(using: String.Encoding.unicode) ?? Data(), options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
    }
    func trimZeroAtStart() -> String {
        let scanner = Scanner(string: self)
        let zeros = CharacterSet(charactersIn: "0")
        scanner.scanCharacters(from: zeros, into: nil)
        let result = (NSString(string: self)).substring(from: scanner.scanLocation)
        print("\(self) reduced to \(String(describing: result))")
        
        return result
    }
    var toLocale: Locale {
        return Locale(identifier: self)
    }
    var superScript: NSMutableAttributedString {
        //let str = apde.isArabic() ? self.enToArDigits : self
        
        //let font:UIFont? = UIFont.applyRegular(fontSize: 15)
        let fontSuper:UIFont? = UIFont.applyHelveticaNeueRegular(fontSize: 10)
        //let attString:NSMutableAttributedString = NSMutableAttributedString(string: self, attributes: [.font:font!])
        //let offset = self.fon.capHeight - fontSuper.capHeight
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attString.setAttributes([.font:fontSuper!,.baselineOffset:4], range: NSRange(location:0,length:4))
        return attString
    }
    var isPhoneNumber: Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var htmlAttributed: (NSAttributedString?, NSDictionary?) {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return (nil, nil)
            }
            
            var dict:NSDictionary?
            dict = NSMutableDictionary()
            return try (NSAttributedString(
                            data: data,
                            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                            documentAttributes: &dict), dict)
        } catch {
            print("error: ", error)
            return (nil, nil)
        }
    }
    
    func htmlAttributed(using font: UIFont, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(font.pointSize)pt !important;" +
                "color: #\(color.hexString!) !important;" +
                "font-family: \(font.familyName), Helvetica !important;" +
                "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(color.hexString!) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
                "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    // Date conversion
    var toDate: Date? {
        if let date =  DateInRegion(self, format:  ISOFormatter.Options.withFullDate.dateFormat, region: Region.ISO) {
            return date.date
        }
        if let date = DateInRegion(self, format: ISOFormatter.Options.withInternetDateTimeExtended.dateFormat, region: Region.ISO) {
            return date.date
        }
        if let date = DateInRegion(self, format: ISOFormatter.Options.withInternetDateTime.dateFormat, region: Region.ISO) {
            return date.date
        }
        if let date = DateInRegion(self, format: DateFormats.rss, region: Region.ISO) {
            return date.date
        }
        if let date = DateFormats.parse(string: self, format: "yyyy-MM-dd'T'HH:mm:ss'Z'", region: .ISO)
        {
            return date.date
        }
        return nil
    }
    
    var dateFromISO: Date? {
        if let date : Date = self.toDate(ISOFormatter.Options.withInternetDateTime.dateFormat, region: Region.ISO)?.date {
            return date
        }
        if let date : Date = self.toDate(ISOFormatter.Options.withInternetDateTimeExtended.dateFormat, region: Region.ISO)?.date {
            return date
        }
        if let date : Date = self.toDate([ISOFormatter.Options.withFullDate.dateFormat, ISOFormatter.Options.withTime.dateFormat], region: Region.ISO)?.date {
            return date
        }
        if let date : Date = self.toDate(["yyyy-MM-dd'T'HH:mm:ss'Z'","yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"], region: .ISO)?.date
        {
            return date
        }
        return nil
    }
    
}
extension Numeric
{
    func currency(numberStyle: NumberFormatter.Style = NumberFormatter.Style.currency, locale: String, groupingSeparator: String? = nil, decimalSeparator: String? = nil) -> String?
    {
        return currency(numberStyle: numberStyle, locale: locale.toLocale, groupingSeparator: groupingSeparator, decimalSeparator: decimalSeparator)
    }
    func currency(numberStyle: NumberFormatter.Style = NumberFormatter.Style.currency, locale: Locale = Locale.current, groupingSeparator: String? = nil, decimalSeparator: String? = nil) -> String?
    {
        if let num = self as? NSNumber {
            let formater = NumberFormatter()
            formater.locale = locale
            formater.numberStyle = numberStyle
            var formatedSting = formater.string(from: num)
            if let separator = groupingSeparator, let localeValue = locale.groupingSeparator {
                formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
            }
            if let separator = decimalSeparator, let localeValue = locale.decimalSeparator  {
                formatedSting = formatedSting?.replacingOccurrences(of: localeValue, with: separator)
            }
            return formatedSting
        }
        return nil
    }
}
extension Double
{
    func setPriceFormatted() -> String
    {
        /*let largeNumber = self
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return self.description.trim() == "" ? "0" : numberFormatter.string(for: largeNumber) ?? "0"*/
        
        return String(format: "%.3f", self)
    }
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double
    {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    func setFormattedStr() -> String
    {
        return String(format: "%.2f", self)
    }
}
extension Collection
{
    public func chunk(n: Int) -> [SubSequence] {
        var res: [SubSequence] = []
        var i = startIndex
        var j: Index
        while i != endIndex {
            j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
            res.append(self[i..<j])
            i = j
        }
        return res
    }
}
/// Array Index Extension which is returns Index of object
extension Array where Array.Element: AnyObject
{
    func index(ofElement element: Element) -> Int?
    {
        for (currentIndex, currentElement) in self.enumerated()
        {
            if currentElement === element
            {
                return currentIndex
            }
        }
        return nil
    }
}
extension URL
{
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}

extension UISearchBar {
    func change(textFont : UIFont?) {
        for view : UIView in (self.subviews[0]).subviews {
            if let textField = view as? UITextField {
                textField.font = textFont
            }
        }
    }
}


typealias Action = (_ refreshControl: UIRefreshControl) -> Void
var completionHandler : Action? = {_ in }

extension UITableView {
    
    func pullToRefresh (completion : @escaping ((_ refreshControl: UIRefreshControl)-> Void)) {
        if self.viewWithTag(10) != nil {
            return
        }
        let refreshControl = UIRefreshControl()
        refreshControl.tag = 10
        refreshControl.tintColor = appConfig.appColors.themeColor
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.tableRefreshed(refreshControl:)), for: .valueChanged)
        completionHandler = completion
        self.addSubview(refreshControl)
    }
    
    @objc func tableRefreshed(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        completionHandler?(refreshControl)
    }
    
    
    func scrollToBottomRow() {
        DispatchQueue.main.async {
            guard self.numberOfSections > 0 else { return }
            
            // Make an attempt to use the bottom-most section with at least one row
            var section = max(self.numberOfSections - 1, 0)
            var row = max(self.numberOfRows(inSection: section) - 1, 0)
            var indexPath = IndexPath(row: row, section: section)
            
            // Ensure the index path is valid, otherwise use the section above (sections can
            // contain 0 rows which leads to an invalid index path)
            while !self.indexPathIsValid(indexPath) {
                section = max(section - 1, 0)
                row = max(self.numberOfRows(inSection: section) - 1, 0)
                indexPath = IndexPath(row: row, section: section)
                
                // If we're down to the last section, attempt to use the first row
                if indexPath.section == 0 {
                    indexPath = IndexPath(row: 0, section: 0)
                    break
                }
            }
            
            // In the case that [0, 0] is valid (perhaps no data source?), ensure we don't encounter an
            // exception here
            guard self.indexPathIsValid(indexPath) else { return }
            
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func indexPathIsValid(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let row = indexPath.row
        return section < self.numberOfSections && row < self.numberOfRows(inSection: section)
    }
}

extension UINavigationItem {
    @objc func setTwoLineTitle(lineOne: String, lineTwo: String) {
        let titleParameters = [NSAttributedString.Key.foregroundColor : UIColor.white,
                               NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)] as [NSAttributedString.Key : Any]
        let subtitleParameters = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                  NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)] as [NSAttributedString.Key : Any]
        
        let title:NSMutableAttributedString = NSMutableAttributedString(string: lineOne, attributes: titleParameters)
        let subtitle:NSAttributedString = NSAttributedString(string: lineTwo, attributes: subtitleParameters)
        
        title.append(NSAttributedString(string: "\n"))
        title.append(subtitle)
        
        let size = title.size()
        
        let width = size.width
        let height = CGFloat(44)
        
        let titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        titleView = titleLabel
    }
}

extension UINavigationController {
    @IBInspectable var SwipeToBackEnable : Bool {
        set(value){ self.interactivePopGestureRecognizer?.isEnabled = value}
        get{return self.interactivePopGestureRecognizer?.isEnabled ?? false }
    }
}

extension Date {
    var time: Time {
        return Time(self)
    }
    func toUTC() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self.description) ?? self
    }
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    func from(year: Int, month: Int, day: Int) -> Date?
    {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? nil
    }
    func beginDateWithZeroTime() -> Date
    {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self) ?? self
    }
    func endDateWithZeroTime() -> Date
    {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: self.beginDateWithZeroTime()) ?? self
    }
    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> Date {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addYears(yearsToAdd: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.year = yearsToAdd
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: self)
        //Return Result
        return futureDate!
    }
    
    func addHours(hoursToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
}

extension PHAsset
{
    
    func getURL(completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
        if self.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            
            self.requestContentEditingInput(with: options) { (input, info) in
                if input != nil {
                    completionHandler(input?.fullSizeImageURL)
                }else {
                    let manager = PHImageManager.default()
                    let option = PHImageRequestOptions()
                    option.isSynchronous = true
                    let _size = CGSize(width: self.pixelWidth, height: self.pixelHeight)
                    
                    manager.requestImage(for: self, targetSize: _size, contentMode: .aspectFit, options: option) { (image, data) in
                        if image != nil {
                            
                            if let _url = getDocumentsDirectory() {
                                let data = image!.pngData()
                                let filePath = _url.appendingPathComponent("temp_\(Int(Date().timeIntervalSince1970)).png")
                                do {
                                    try data?.write(to: filePath)
                                    completionHandler(filePath)
                                }
                                catch {
                                    completionHandler(nil)
                                }
                                
                            }else{
                                completionHandler(nil)
                            }
                            
                        }else{
                            completionHandler(nil)
                        }
                        
                    }
                }
            }
            
        } else if self.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: self, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) -> Void in
                if let urlAsset = asset as? AVURLAsset {
                    let localVideoUrl: URL = urlAsset.url as URL
                    completionHandler(localVideoUrl)
                } else {
                    completionHandler(nil)
                }
            })
        }
    }
}
extension Encodable
{
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    var toData: Data? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return data//(try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension UISegmentedControl {
    func selectedColor(color: UIColor) {
        let font = UIFont(name: appConfig.appFonts.HelveticaNeueMedium, size: 15) as Any
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
        self.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    func normalColor(color: UIColor) {
        let font = UIFont(name: appConfig.appFonts.HelveticaNeueRegular, size: 15) as Any
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
}
extension UICollectionViewFlowLayout {
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}
extension WKWebView {
    func loadUrl(string: String) {
        if let url = URL(string: string) {
            load(URLRequest(url: url))
        }
    }
}

