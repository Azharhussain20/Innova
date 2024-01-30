//
//  LoginViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 25/01/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    //------------------------------------------
    //MARK: - Outlets -
    @IBOutlet weak var btnLogin: GreenThemeButton!
    
    @IBOutlet weak var btnRegistration: PlainTextButton!
    @IBOutlet weak var btnLoginWithApple: WhiteButtonWithImage!
    @IBOutlet weak var btnLoginWithGoogle: WhiteButtonWithImage!
    @IBOutlet weak var btnForgotPassword: UIButton!
    //------------------------------------------
    //MARK: - Class Variables -
    
    //------------------------------------------
    //MARK: - Memory Management -
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit
    {
        
    }
    
    //------------------------------------------
    //MARK: - Custom Methods -
    @objc func setupLayout()
    {
    }
    
    //------------------------------------------
    //MARK: - API Methods -
    //------------------------------------------
    
    //MARK: - Action Methods -
    @IBAction func btnOkAction(_ sender: UIButton)
    {
    }
    
    @IBAction func btnForgotPasswordTapped(_ sender: UIButton) {
        let initiliazeVC : ForgotPasswordViewController = Utilities.viewController(name: "ForgotPasswordViewController", onStoryboard: "Introduction") as! ForgotPasswordViewController
        AppInstance._navigation.pushViewController(initiliazeVC, animated: true)

    }
    //------------------------------------------
    //MARK: - View Life Cycle Methods -
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addTapToDismissKeyboard()
        self.configurationTitleAndBack(title: "Accedi", imageName: "chevron.left")
        self.backTapped = {
            AppInstance.goToIntroDuctionPage(transition: true)
        }
        self.perform(#selector(setupLayout), with: nil, afterDelay: 0.0)
        self.btnLogin.touchUpInside = {
            AppInstance.goToHomeCreationPage(transition: true)
        }
        self.btnRegistration.touchUpInside = {
            AppInstance.goToRegisterScreenPage(transition: true)
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
    }
    
}
