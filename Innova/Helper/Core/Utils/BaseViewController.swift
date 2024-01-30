//
//  BaseViewController.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//


import UIKit
import Photos

class BaseViewController : UIViewController
{
    var style:UIStatusBarStyle = .default
    var backTapped:(() -> Void)?

    var dismissKeyboardTap : UITapGestureRecognizer?
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return self.style
    }
    func changeStyle(_ myStyle : UIStatusBarStyle)
    {
        self.style = myStyle
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    //MARK: - Dismiss Keyboard when tap outside the button
    open func addTapToDismissKeyboard () {
        self.dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(dismissKeyboardTap!)
    }
    
    //MARK: - Dismiss Keyboard when tap outside the button
    open func configurationTitleAndBack(title : String, imageName : String) {
        self.title = title
        let chevronleft = UIBarButtonItem(image: UIImage(named: imageName), style: .plain, target: self, action: #selector(back))
        chevronleft.tintColor = appConfig.appColors.themeColor
        self.navigationItem.leftBarButtonItem  = chevronleft
    }
    @objc func back(){
        self.backTapped?()
        print("clicked")
        AppInstance._navigation.popViewController(animated: true)
    }
    @objc open func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //MARK: - Camera | Gallary Option methods -
    /*func showPhotoMenu(sender: UIButton)
     {
     let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
     
     let takePhotoAction = UIAlertAction(title: "Camera".localized, style: .default, handler: { _ in self.takePhotoWithCamera()})
     alertController.addAction(takePhotoAction)
     
     let chooseFromLibraryAction = UIAlertAction(title: "Gallery".localized, style: .default, handler: {_ in self.choosePhotoFromLibrary()})
     alertController.addAction(chooseFromLibraryAction)
     
     let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
     alertController.addAction(cancelAction)
     
     
     if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
     {
     alertController.popoverPresentationController!.sourceView = sender
     alertController.popoverPresentationController!.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
     self.present(alertController, animated: true, completion: nil)
     }
     else
     {
     self.present(alertController, animated: true,
     completion: nil)
     }
     }*/
    func takePhotoWithCamera()
    {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        if status == .authorized
        {
            // authorized
            if(UIImagePickerController.isSourceTypeAvailable(.camera))
            {
                DispatchQueue.main.async {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = true
                    imagePicker.view.tintColor = self.view.tintColor
                    imagePicker.modalPresentationStyle = .fullScreen
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            else
            {
                DispatchQueue.main.async {
                    AppInstance.showMessages(message: "you_dont_have_permission_to_access_camera")
                }
            }
        }
        else if status == .denied || status == .restricted
        {
            // denied
            let alertController = UIAlertController (title: "please_provide_camera_access_permission_by_going_into_settings", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else
        {
            // Not determined.
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {(granted: Bool) -> Void in
                
                if granted
                {
                    if(UIImagePickerController.isSourceTypeAvailable(.camera))
                    {
                        DispatchQueue.main.async {
                            let imagePicker = UIImagePickerController()
                            imagePicker.sourceType = .camera
                            imagePicker.delegate = self
                            imagePicker.allowsEditing = true
                            imagePicker.view.tintColor = self.view.tintColor
                            imagePicker.modalPresentationStyle = .fullScreen
                            self.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        AppInstance.showMessages(message: "you_dont_have_permission_to_access_camera")
                    }
                }
            })
        }
    }
    func choosePhotoFromLibrary()
    {
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.authorized)
        {
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
            {
                DispatchQueue.main.async {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = true
                    imagePicker.view.tintColor = self.view.tintColor
                    imagePicker.modalPresentationStyle = .fullScreen
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            else
            {
                DispatchQueue.main.async {
                    AppInstance.showMessages(message: "you_dont_have_permission_to_access_gallery")
                    
                }
            }
        }
        else if (status == PHAuthorizationStatus.denied) || (status == PHAuthorizationStatus.restricted)
        {
            let alertController = UIAlertController (title: "please_provide_gallery_access_permission_by_going_into_settings", message: nil, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else
        {
            PHPhotoLibrary.requestAuthorization({(status: PHAuthorizationStatus) -> Void in
                if status == .authorized
                {
                    if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
                    {
                        DispatchQueue.main.async {
                            let imagePicker = UIImagePickerController()
                            imagePicker.sourceType = .photoLibrary
                            imagePicker.delegate = self
                            imagePicker.allowsEditing = true
                            imagePicker.view.tintColor = self.view.tintColor
                            imagePicker.modalPresentationStyle = .fullScreen
                            self.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
                else
                {
                    DispatchQueue.main.async {
                        AppInstance.showMessages(message: "you_dont_have_permission_to_access_gallery")
                    }
                }
            })
        }
    }
    func didSelectedImage(image: UIImage?) {
        
    }
    
    /*func pushToImageVC<T: UIViewController>(withType type: T.Type)
     {
     let resultVC = Utilities.viewController(name: "TakePhotoVC", onStoryboard: StoryboardNames.Profile.rawValue) as! TakePhotoVC
     resultVC.PopVCType = T
     self.navigationController?.pushViewController(resultVC, animated: true)
     }*/
}
extension BaseViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.editedImage] as? UIImage
        
        didSelectedImage(image: img)
        
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        didSelectedImage(image: nil)
        picker.dismiss(animated: true, completion: nil)
    }
}

