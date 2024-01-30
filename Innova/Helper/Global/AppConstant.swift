//
//  AppConstant.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit


//MARK:- *********************** APP INFO ****************************************
var APPNAME:String = "NLG"

///App store link
var APPSTORE_URL = ""
var PLAYSTORE_URL = ""
var AppDesc: String = ""
var AppContanctMail:String = ""

let GOOGLE_CLIENT_ID = ""//"339167717674-gkj3envd3l7lltilkjpfrdspjsdqlrvh.apps.googleusercontent.com"
let GOOGLE_KEY = "AIzaSyCyTSz8iKemdTBwlRS75FcI5Qn5G_J4vUk"//"AIzaSyBc7eNXqGoEUzRUeQCugD0Ni13Jq89Qqvs"

///User Default Object
var DEFAULT = UserDefaults.standard
var default_intro_viewed = "default_intro_viewed"
let language_state = "language_state"
let APPLE_LANGUAGE_KEY = "AppleLanguages"

///PlaceHolder Color
//var placeHolderColor = "#939393"


//MARK:- *********************** Common Struct List ****************************************
struct ScreenSizes
{
    static let SCREEN_SIZE          = UIScreen.main.bounds.size
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSizes.SCREEN_WIDTH, ScreenSizes.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSizes.SCREEN_WIDTH, ScreenSizes.SCREEN_HEIGHT)
}

let kMainScreen         = UIScreen.main.bounds
let kMainScreenWidth    = UIScreen.main.bounds.size.width
let kMainScreenHeight   = UIScreen.main.bounds.size.height


var notificationCount = 0 {
    didSet (value){
        if value < 0 {
            notificationCount = 0
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationChanged"), object: nil)
    }
}


//MARK:- *********************** enum List ****************************************
///StoryBoard Name List
enum StoryboardNames : String
{
    case Authentication = "Authentication"
    case Common = "Common"
    
}
///MARK: - Enum of PhotoPickerOptions -
enum EnumPhotoPickerOptions {
    case Camera
    case Gallery
}
///MARK: - Enum AddProfile Flow
enum EnumProfileNav
{
    //typealias RawValue = String
    
    //case None
    case OnBoarding
    case AddProfileSetupVC
    case Dashboard
    case EditTrackerVC
}
///MARK: - Enum AddProfile Flow
enum EnumTrackerNav
{
    //typealias RawValue = String
    
    //case None
    case OnBoarding
    case AddProfileSetupVC
    case Dashboard
    case EditTrackerVC
    case TrackerSettingsVC
}
///MARK: - Enum AddProfile Flow
enum EnumGeofenceNav
{
    //typealias RawValue = String
    
    //case None
    case OnBoarding
    case GeofenceList
    case Dashboard
    case ApplyGeofenceToAssetVC
}
///MARK: - Enum Indicator Visibility while
enum IndicatorVisibility
{
    case display
    case none
}
///MARK: - Enum verify OTP Type
enum VerifyOtpTypesAPI: String
{
    case Default = ""
    case ForgotPassword = "f"
    case EditProfie = "e"
}
///MARK: - Enum for OTP Verification Screen -
enum Enum_OTP_verification: String
{
    case reset = "reset"
    case sign_up = "sign_up"
    case edit_profile = "edit_profile"
}

///MARK: - Enum for Rules and Notification -
enum EnumRulesCategory: String
{
    case STATUS = "STATUS"
    case SECURITY = "SECURITY"
    case HEALTH = "HEALTH"
}

///MARK: - Current Language Type -
enum Enum_LanguageType: Int
{
    case English = 0
    case Arabic = 1
}

///MARK: - Enum of Categories -
enum EnumCategory: String
{
    case Item = "Item"
    case Pet = "Pet"
    case Bike = "Bike"
    case Person = "Person"
    
    public var Plural: String {
        switch self
        {
        case .Item:
            return "Items"
        case .Pet:
            return "Pets"
        case .Bike:
            return "Bikes"
        case .Person:
            return "Person"
        }
    }
}

///MARK: - Enum of Time -
enum EnumTimeFormat: String
{
    case AM = "AM"
    case PM = "PM"
    
    public var index: Int {
        switch self
        {
        case .AM:
            return 0
        case .PM:
            return 1
        }
    }
    
    public var description: String {
        switch self
        {
        case .AM:
            return "AM"
        case .PM:
            return "PM"
        }
    }
}

///MARK: - Enum of Categories -
enum EnumUnits: String
{
    case Metric = "Metric"
    case Imperial_US = "Imperial (US)"
    case Imperial_UK = "Imperial (UK)"
    
    func weightUnit() -> String
    {
        switch self
        {
        case .Imperial_US:
            return "lbs"
        case .Imperial_UK:
            return "lbs"
        default:
            return "kg"
        }
    }
    
    func heightUnit() -> String
    {
        switch self
        {
        case .Imperial_US:
            return "in"
        case .Imperial_UK:
            return "in"
        default:
            return "cm"
        }
    }
    
    func distanceUnit() -> String
    {
        switch self
        {
        case .Imperial_US:
            return "mile"
        case .Imperial_UK:
            return "mile"
        default:
            return "km"
        }
    }
}

