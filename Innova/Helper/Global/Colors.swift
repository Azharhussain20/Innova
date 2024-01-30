//
//  Colors.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//


import Foundation
import UIKit


protocol ThemeColors
{
    var barStyle: UIBarStyle { get }
    
    var themeColor: UIColor { get }
    var placeHolderColor: UIColor { get }
    
    //Navigation Colors
    var navBarAttributeColor: UIColor { get }
    var navBarBgColor: UIColor { get }
    var navTextTitleColor: UIColor { get }
    
    var radioUnSelected: UIColor { get }
    var radioSelectedColor: UIColor { get }
    
    //Utilities Textfield configuration
    var viewBGColor: UIColor { get }
    var viewSelectedColor: UIColor { get }
    
    //TTGSnackbar Colors
    var SnackBarErrorColor: UIColor { get }
    var SnackBarSuccessColor: UIColor { get }
    var SnackBarGreylight: UIColor { get }
    
    //imei textfild properties
    var textfieldLineActiveColor: UIColor { get }
    var textfieldLineinActiveColor: UIColor { get }
    
    //Button properties
    var buttonThemeColor: UIColor { get }
    var btnInActiveView: UIColor { get }
    var btnActiveView: UIColor { get }
    var btnInActiveTextColor: UIColor { get }
    var btnInActiveViewBorderColor: UIColor { get }
    var borderColorOfButtons: UIColor { get }
    //Camera & Gallery Picker
    var cameraLayer: UIColor { get }
    
    //Validation Message Color
    var validationStringColor: UIColor { get }
    var validationStringSuccess: UIColor { get }
    
    //Lable and Textfield Enable/Disable Color
    var textEnableColor: UIColor { get }
    var textDisableColor: UIColor { get }
    
}

class AppColors : ThemeColors
{
    

    var themeColor = UIColor(red: 0, green: 0.514, blue: 0.459, alpha: 1) //Use Label and textfield Active color
    var barStyle: UIBarStyle = .black
    let placeHolderColor = UIColor.lightGray.withAlphaComponent(0.5)
    
    //Navigation Colors
    let navBarAttributeColor = UIColor.white
    let navBarBgColor = UIColor(red: 0.0/255.0, green: 169.0/255.0, blue: 224.0/255.0, alpha: 1.0)
    let navTextTitleColor = UIColor(hexString: "#222B45")
    
    let radioUnSelected = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    let radioSelectedColor = UIColor(red: 0.0/255.0, green: 169.0/255.0, blue: 224.0/255.0, alpha: 1.0)
    
    let viewBGColor = UIColor(hexString: "#ECDCEA", alpha: 0.5)
    let viewSelectedColor = UIColor(hexString: "#AF71A5")
    
    //Button properties
    let buttonThemeColor = UIColor(hexString: "#008375")
    let btnActiveView = UIColor(hexString: "#008375")
    let btnInActiveView = UIColor(hexString: "#E0E0E0")
    let btnInActiveTextColor = UIColor(hexString: "#636569")
    let btnInActiveViewBorderColor = UIColor(hexString: "#E4E9F2")
    let borderColorOfButtons = UIColor(hexString: "#636569")
    
    let SnackBarErrorColor = UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 70.0/255.0, alpha: 1.0)
    let SnackBarSuccessColor = UIColor(red: 0.0/255.0, green: 184.0/255.0, blue: 159.0/255.0, alpha: 1.0)
    let SnackBarGreylight = UIColor.lightGray
    
    let textfieldLineActiveColor = UIColor(red: 0.0/255.0, green: 186.0/255.0, blue: 242.0/255.0, alpha: 1.0)
    let textfieldLineinActiveColor = UIColor(red: 0.0/255.0, green: 184.0/255.0, blue: 159.0/255.0, alpha: 0.3)
    
    let cameraLayer = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.8)
 
    let validationStringColor = UIColor(red: 212.0/255.0, green: 50.0/255.0, blue: 19.0/255.0, alpha: 1.0)
    var validationStringSuccess = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0) //Use Label and textfield default color
    
    //Label and Textfield Enable/Disable Color
    var textEnableColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    var textDisableColor = UIColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 1.0)

}

