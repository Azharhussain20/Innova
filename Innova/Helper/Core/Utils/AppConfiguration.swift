//
//  AppConfiguration.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import SwiftyJSON
import UIKit

private var _sharedConfig = AppConfiguration()
var appConfig = AppConfiguration.sharedInstance

class AppConfiguration: NSObject
{
    var identifier: String?
    
    //Other Variables for configuration
    var appColors : ThemeColors!
    var appFonts : ThemeFonts!
    var refereshIntervalTime = 10
    
    //Password Length
    let MinPasswordLength = 6
    let MaxPasswordLength = 20
    
    //Mobile Length
    let MinMobileNoLength = 7
    let MaxMobileNoLength = 10
    
    //Geofence config
    var geofenceMinRadius = 1 //0.01
    var geofenceMaxRadius = 25 //1.0
    var geofenceDefaultRadius = 5 //0.3
    
    //API Configuration
    let Platform =  2 //2=ios
    var deviceToken: String = UUID().uuidString
    
   
    
    override init()
    {
        super.init()
    }
    class var sharedInstance: AppConfiguration
    {
        if _sharedConfig.identifier == nil
        {
            _sharedConfig.loadFromDefault()
        }
        return _sharedConfig
    }
    
    func loadFromDefault()
    {
        appColors = AppColors()
        appFonts = AppFonts()
    }
}

