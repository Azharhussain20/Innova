//
//  ProfileViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 30/01/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var noImageView: UIView!
    
    @IBOutlet weak var noImageTxt: UILabel!
    @IBOutlet weak var btnEditNickName: UIButton!
    @IBOutlet weak var btnEditName: UIButton!
    var imageURL = "https://source.unsplash.com/random"
//    var imageURL = ""
    
    override func viewDidAppear(_ animated: Bool) {
        self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2
        self.noImageView.layer.cornerRadius = self.noImageView.frame.size.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                      
        fetchAndDisplayImage()
     
        
        }
        
    func fetchAndDisplayImage() {
        if let imageUrl = URL(string: imageURL) {
           imageView.kf.setImage(with: imageUrl)
            imageView.isHidden = false
            noImageView.isHidden = true
                } else {
                    print("Invalid URL")
                    noImageView.isHidden = false
                    let initials = extractInitials(from: txtName.text!)
                    noImageTxt.text = initials
                }
        }
    
    func extractInitials(from name: String) -> String {
        let words = name.components(separatedBy: " ")
        var initials = ""
        for word in words {
            if let firstCharacter = word.first {
                initials.append(firstCharacter)
            }
        }
        return initials
    }
    
    @IBAction func btnPressedLogout(_ sender: Any) {
        showAlert(
            title: "Esci utente",
            message: "Sei sicuro di voler uscire da questo account?",
            type: .twoButtons(
                button1: (
                    title: "Annulla",
                    style: .cancel,
                    handler: {
                        // Handle the Cancel button tap action
                        print("Annulla button tapped")
                        AppInstance._navigation.popViewController(animated: true)
                    }
                ),
                button2: (
                    title: "Cancella",
                    style: .default,
                    handler: {
                        // Handle the OK button tap action
                        let initiliazeVC : LoginViewController = Utilities.viewController(name: "LoginViewController", onStoryboard: "Introduction") as! LoginViewController
                        AppInstance._navigation.pushViewController(initiliazeVC, animated: true)
                        print("LoginViewController")
                    }
                )
            ),
            viewController: self
        )

    }
    
    @IBAction func btnPressedDeleteAccount(_ sender: Any) {
        showAlert(
            title: "Cancella utente",
            message: "Sei sicuro di voler eliminare questo account? Eliminandolo, cancellerai anche la casa collegata a questo account.",
            type: .twoButtons(
                button1: (
                    title: "Annulla",
                    style: .cancel,
                    handler: {
                        // Handle the Cancel button tap action
                        print("Annulla button tapped")
                        AppInstance._navigation.popViewController(animated: true)
                    }
                ),
                button2: (
                    title: "Cancella",
                    style: .default,
                    handler: {
                        // Handle the OK button tap action
                        let initiliazeVC : LoginViewController = Utilities.viewController(name: "LoginViewController", onStoryboard: "Introduction") as! LoginViewController
                        AppInstance._navigation.pushViewController(initiliazeVC, animated: true)
                        print("LoginViewController")
                    }
                )
            ),
            viewController: self
        )

    }
    @IBAction func pressedName(_ sender: Any) {
        
        if !txtName.isUserInteractionEnabled {
            txtName.isUserInteractionEnabled = true
            txtName.placeholder = txtName.text
            txtName.text = ""
            btnEditName.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        } else {
            txtName.text = ""
            txtName.isUserInteractionEnabled = false
            txtName.text = txtName.placeholder
            txtName.text = ""
            btnEditName.setImage(UIImage(systemName: "pencil"), for: .normal)
        }
    }
    
    @IBAction func pressedNickName(_ sender: Any) {
        if !txtNickName.isUserInteractionEnabled {
            txtNickName.isUserInteractionEnabled = true
            txtNickName.placeholder = txtNickName.text
            txtNickName.text = ""
            btnEditNickName.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        } else {
            txtNickName.text = ""
            txtNickName.isUserInteractionEnabled = false
            txtNickName.text = txtName.placeholder
            txtNickName.text = ""
            btnEditNickName.setImage(UIImage(systemName: "pencil"), for: .normal)
       }
    }
}
