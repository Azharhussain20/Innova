//
//  TTGSnackbarConfig.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import TTGSnackbar
enum SnackType {
    case Error
    case Success
    case Info
}
let sharedSnackBar = TTGSnackbar()
func showMessage(text:String, type : SnackType = .Error, view: UIView? = nil)
{
    if view != nil {
        addMessageLabelOnView(suprView: view!, withMessage: "MSG_NO_DATA")
    }
    
    if text.lowercased() == "unauthenticated" {
        showMessage(text: "MSG_SOMETHING_WRONG" +  "\nplease login again")
        //kCurrentUser.logOut()
        //AppInstance.goToLoginScreenPage(transition: true)
        return
    }
    
    sharedSnackBar.message = text.isEmpty ? "MSG_SOMETHING_WRONG" : text
    sharedSnackBar.duration = text.count > 50 ? .long : .middle
    sharedSnackBar.topMargin = 20
    sharedSnackBar.animationType = .slideFromTopBackToTop
    sharedSnackBar.backgroundColor = appConfig.appColors.themeColor //UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
    sharedSnackBar.shouldDismissOnSwipe = true
    sharedSnackBar.messageTextFont = UIFont.applyHelveticaNeueRegular(fontSize: 16.0)
    sharedSnackBar.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    sharedSnackBar.messageTextColor = UIColor.white
    
    /*switch type {
    case .Error:
        sharedSnackBar.messageTextColor = appConfig.appColors.SnackBarErrorColor
    //sharedSnackBar.icon = #imageLiteral(resourceName: "ic_error")
    case .Success:
        sharedSnackBar.messageTextColor = appConfig.appColors.SnackBarSuccessColor
    //sharedSnackBar.icon = #imageLiteral(resourceName: "ic_success")
    case .Info:
        sharedSnackBar.messageTextColor = appConfig.appColors.SnackBarGreylight
        //sharedSnackBar.icon = #imageLiteral(resourceName: "ic_information")
    }*/
    
    sharedSnackBar.show()
}
func showMessageWithOptions(text:String, opt1 : String, opt2 : String, completion : @escaping ((String) -> Void)) {
    
    let SnackBar = TTGSnackbar()
    
    SnackBar.message = text.isEmpty ? "MSG_SOMETHING_WRONG" : text
    SnackBar.duration = .long
    SnackBar.topMargin = 20
    SnackBar.animationType = .slideFromTopBackToTop
    SnackBar.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
    SnackBar.shouldDismissOnSwipe = true
    SnackBar.messageTextFont = UIFont.applyHelveticaNeueBold(fontSize: 16.0)
    SnackBar.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    SnackBar.messageTextColor = UIColor.gray
    
    // Action 1
    SnackBar.actionText = opt1
    //let maxOPt = opt1.characters.count > opt2.characters.count ? opt1 : opt2
    //SnackBar.actionMaxWidth = maxOPt.sizeForWidth(width: 150, height: 20, font: UIFont.applyBold(fontSize: 15.0)).width
    SnackBar.actionTextFont = UIFont.applyHelveticaNeueBold(fontSize: 15.0)
    SnackBar.actionTextColor = appConfig.appColors.themeColor
    SnackBar.actionBlock = { (snackbar) in snackbar.dismiss(); completion(opt1) }
    
    // Action 2
    SnackBar.secondActionText = opt2
    SnackBar.secondActionTextFont = UIFont.applyHelveticaNeueBold(fontSize: 15.0)
    SnackBar.secondActionTextColor = appConfig.appColors.themeColor
    SnackBar.secondActionBlock = { (snackbar) in snackbar.dismiss(); completion(opt2) }
    
    SnackBar.show()
}

