//
//  AppDelegate.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit
import IQKeyboardManagerSwift
import SwiftMessages
var AppInstance: AppDelegate!

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var _navigation : UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppInstance = self
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.gotoDashboard(transition: true)
        return true
    }
    //MARK: - Keyboard Init methods -
    func initailizeIQKeyboard()
    {
        //IQKeyboard
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.toolbarManageBehaviour = IQAutoToolbarManageBehaviour.bySubviews
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
    }
    
    //MARK: - Function of Error Message view -
    func showMessages(message: String)
    {
        if message != ""
        {
            let warning = MessageView.viewFromNib(layout: .cardView)
            warning.configureTheme(backgroundColor: appConfig.appColors.themeColor, foregroundColor: UIColor.white)
            warning.configureDropShadow()
            warning.configureContent(body: message)
            warning.button?.isHidden = true
            warning.iconImageView?.isHidden = true
            warning.titleLabel?.isHidden = true
            
            var config = SwiftMessages.Config()
            config.duration = .seconds(seconds: 3.0)
            SwiftMessages.show(config: config, view: warning)
        }
        
        //SwiftMessages.show(view: warning)
    }
    //MARK: - Error Label for View -
    func showErrorLabelinView(isshow: Bool = true, view: UIView, Message: String)
    {
        for views in view.subviews {
            if views.accessibilityIdentifier == "errViewSub" {
                views.removeFromSuperview()
                //break
            }
        }
        if isshow
        {
            let lbl = UILabel()
            lbl.frame = CGRect(x: 20, y: view.frame.size.height/2 - 30, width: view.frame.size.width - 40, height: 60)
            print(lbl.frame)
            lbl.font = UIFont.applyHelveticaNeueRegular(fontSize: 16)
            lbl.text = Message
            lbl.textColor = UIColor.gray
            lbl.numberOfLines = 4
            lbl.lineBreakMode = .byTruncatingTail
            lbl.accessibilityIdentifier = "errViewSub"
            lbl.textAlignment = .center
            lbl.minimumScaleFactor = 0.5
            lbl.allowsDefaultTighteningForTruncation = true
            lbl.adjustsFontSizeToFitWidth = true
            view.addSubview(lbl)
            view.bringSubviewToFront(lbl)
        }
        else {
            for views in view.subviews {
                if views.accessibilityIdentifier == "errViewSub" {
                    views.removeFromSuperview()
                    //break
                }
            }
        }
    }
    func printFonts() {
            let fontFamilyNames = UIFont.familyNames
            for familyName in fontFamilyNames {
                print("------------------------------")
                print("Font Family Name = [\(familyName)]")
                let names = UIFont.fontNames(forFamilyName: familyName)
                print("Font Names = [\(names)]")
            }
        }

    
    //MARK: - Navigation methods -
    
    func goToLoginScreenPage(transition : Bool) {
        let initiliazeVC : LoginViewController = Utilities.viewController(name: "LoginViewController", onStoryboard: "Introduction") as! LoginViewController
        _navigation = UINavigationController(rootViewController: initiliazeVC)
        _navigation.setNavigationBarHidden(false, animated: true)
        let transitionOption = transition ? UIView.AnimationOptions.transitionFlipFromLeft : UIView.AnimationOptions.transitionFlipFromLeft
        gotoViewController(viewController: _navigation, transition: transitionOption)
    }
    
    func goToHomeCreationPage(transition : Bool) {
        let initiliazeVC : CreateHome = Utilities.viewController(name: "CreateHome", onStoryboard: "Introduction") as! CreateHome
        _navigation = UINavigationController(rootViewController: initiliazeVC)
        _navigation.setNavigationBarHidden(false, animated: true)
        let transitionOption = transition ? UIView.AnimationOptions.transitionFlipFromLeft : UIView.AnimationOptions.transitionFlipFromLeft
        gotoViewController(viewController: _navigation, transition: transitionOption)
    }
    
    func goToIntroDuctionPage(transition : Bool) {
        let initiliazeVC : IntroductionScreen = Utilities.viewController(name: "IntroductionScreen", onStoryboard: "Introduction") as! IntroductionScreen
        _navigation = UINavigationController(rootViewController: initiliazeVC)
        _navigation.setNavigationBarHidden(false, animated: true)
        let transitionOption = transition ? UIView.AnimationOptions.transitionFlipFromLeft : UIView.AnimationOptions.transitionFlipFromLeft
        gotoViewController(viewController: _navigation, transition: transitionOption)
    }
    
    func gotoDashboard(transition : Bool) {
        let initiliazeVC : DashTabController = Utilities.viewController(name: "DashTabController", onStoryboard: "Dashboard") as! DashTabController
        _navigation = UINavigationController(rootViewController: initiliazeVC)
        _navigation.setNavigationBarHidden(true, animated: true)
        let transitionOption = transition ? UIView.AnimationOptions.transitionFlipFromLeft : UIView.AnimationOptions.transitionFlipFromLeft
        gotoViewController(viewController: _navigation, transition: transitionOption)
    }
    func goToRegisterScreenPage(transition : Bool) {
        let initiliazeVC : RegisterViewController = Utilities.viewController(name: "RegisterViewController", onStoryboard: "Introduction") as! RegisterViewController
        _navigation = UINavigationController(rootViewController: initiliazeVC)
        _navigation.setNavigationBarHidden(false, animated: true)
        let transitionOption = transition ? UIView.AnimationOptions.transitionFlipFromLeft : UIView.AnimationOptions.transitionFlipFromLeft
        gotoViewController(viewController: _navigation, transition: transitionOption)
    }
    func gotoViewController(viewController: UIViewController, transition: UIView.AnimationOptions)
    {
        if transition != UIView.AnimationOptions.showHideTransitionViews
        {
            UIView.transition(with: self.window!, duration: 0.5, options: transition, animations: { () -> Void in
                self.window!.rootViewController = viewController
            }, completion: { (finished: Bool) -> Void in
                
            })
        }
        else
        {
            window!.rootViewController = viewController
        }
    }
    
    
    //MARK: - Localization -
    class func getBundle(_ lang : String) -> Bundle {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return bundle!
    }
    
    class func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentWithoutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        return currentWithoutLocale
    }
    
    class func currentAppleLanguageFull() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
}

