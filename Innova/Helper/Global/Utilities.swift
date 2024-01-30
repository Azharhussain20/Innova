//
//  Utilities.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit
import AVFoundation

class Utilities
{
    class func viewController(name: String, onStoryboard storyboardName: String) -> UIViewController
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: name) as UIViewController
    }
    
    class func viewTableController(name: String, onStoryboard storyboardName: String) -> UITableViewController
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: name) as! UITableViewController
    }
    
    //MARK: - Check DeviceType -
    func isiPad() -> Bool
    {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }
    
    //MARK: - Set Hex Color Code Function -
    func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //MARK: - Validation -
    class func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "^(?!\\.)(?!.*\\.$)(?!.*?\\.\\.)[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        //let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        if result == false
        {
            //showMessage(text: vali.valid_email.rawValue)
        }
        return result
    }
    class func isValidMobileNumber(testStr:String) -> Bool
    {
        if (testStr.count == 9)
        {
            return true
        }
        else
        {
            return false
        }
    }
    class func isValidPassword(testStr:String) -> Bool {
        
        if (testStr.count >= 6) && (testStr.count <= 12)
        {
            return true
        }
        else
        {
            return false
        }
    }
    class func validateemptyfield(textfield : UITextField) -> Bool
    {
        if (textfield.text?.isEmpty)!
        {
            return true
        }
        return false
    }
    class func isValidUser(textfield : UITextField)  -> Bool
    {
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", "^\\w+( +\\w+)*$")
        let result = passwordTest.evaluate(with: textfield.text)
        return result
    }
    class func isValidRegex(testStr:String , regex: String) -> Bool
    {
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", regex)
        let result = passwordTest.evaluate(with: testStr)
        return result
        
    }
    class func isValidUsername(_ Input:String) -> Bool
    {
        let usernameRegEx = "\\A\\w{1,50}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return Test.evaluate(with: Input)
    }
    class func trimWhiteSpaces(text : NSString)-> NSString
    {
        return text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
    }
    class func isValidateURL (stringURL : String) -> Bool
    {
        let urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        return predicate.evaluate(with: stringURL)
    }
    
    //MARK: - Weather Calculation functions -
    class func degToCompass(windBearing:CGFloat) -> String
    {
        let val = floor((windBearing / 22.5) + 0.5);
        let arr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
        return arr[Int(val) % 16];
    }
    /*
     function : getLunarPhases
     parameters : ( year : Int , month : Int , day: Int)
     output :
     
     description : return lunar phases
     */
    class func getLunarPhases(y : Int, m : Int, d : Int ) -> String
    {
        var year : Int = y
        var month : Int = m
        var c : Int = 0
        var e : Int = 0
        var jd : Double = 0.0
        
        var b : Int = 0
        
        if month < 3
        {
            year -= 1
            month += 12
        }
        
        month += 1
        
        c = Int(365.25 * Double(year))
        e = Int(30.6*Double(m))
        jd = Double(c+e+d)-694039.09
        jd /= 29.53
        b = Int(jd)
        
        jd = jd - Double(b)
        b = Int(jd*8+0.5)
        
        var moon_phase : String = ""
        switch b {
        case 0,8 : moon_phase = "New moon"
        case 1 : moon_phase = "Waxing crescent"
        case 2 : moon_phase = "First quarter"
        case 3 : moon_phase = "Waxing gibbous"
        case 4 : moon_phase = "Full moon"
        case 5 : moon_phase = "Waning gibbous"
        case 6 : moon_phase = "Third quarter"
        case 7 : moon_phase = "Waning crescent"
        default : moon_phase = "Unknown phase"
        }
        
        return moon_phase
    }
    
    //MARK: - Date/Time operation Functions -
    
    //Used in Datepicker field in Spooray
    class func getDateFromTimestampFormatted(timestamp: Int) -> String
    {
        if timestamp == 0
        {
            return ""
        }
        else
        {
            let utcDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let fmDate = DateFormatter()
            fmDate.dateFormat = "MMM, dd YYYY"
            return fmDate.string(from: utcDate)
        }
    }
    //Used in Post List Date, Event List Date, Event Details
    class func getDateFromTimestampFormattedPostEvent(timestamp: Int) -> String
    {
        if timestamp == 0
        {
            return ""
        }
        else
        {
            let utcDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let fmDate = DateFormatter()
            fmDate.dateFormat = "EEE, dd MMM YYYY hh:mm a"
            return fmDate.string(from: utcDate)
        }
    }
    //Used in comment
    class func getTimeFromTimestampFormatted(timestamp: Int) -> String
    {
        if timestamp == 0
        {
            return ""
        }
        else
        {
            let utcDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let fmDate = DateFormatter()
            fmDate.dateFormat = "hh:mm a"
            return fmDate.string(from: utcDate)
        }
    }
    
    
    class func getTodayDate() -> String
    {
        let utcDate = Date()
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd MMM YYYY"
        return fmDate.string(from: utcDate)
    }
    class func getCurrentTime() -> String
    {
        let utcDate = Date()
        let fmDate = DateFormatter()
        fmDate.dateFormat = "hh:mm a"
        return fmDate.string(from: utcDate)
    }
    class func getDateFromTimeStampFishLogger(timestamp: Int) -> String
    {
        if timestamp == 0
        {
            return ""
        }
        else
        {
            let utcDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let fmDate = DateFormatter()
            fmDate.dateFormat = "dd MMM YYYY hh:mm a"
            return fmDate.string(from: utcDate)
        }
    }
    
    class func getFormatedTimeInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "hh:mm a"
        return fmDate.string(from: dateTime as Date)
    }
    class func localDateFromUTC(timestamp: Int64) -> NSDate
    {
        let utcDate = NSDate(timeIntervalSince1970: Double(timestamp))
        let localTimeZoneInSeconds : Double = 0.0//Double(NSTimeZone.localTimeZone().secondsFromGMT)
        let localDate = utcDate.addingTimeInterval(localTimeZoneInSeconds)
        return localDate
    }
    class func timeFormatFromSecondsintwenty (seconds : Double) -> String
    {
        let seconds = Int(seconds)
        let minutes: Int = (seconds / 60) % 60
        let hours: Int = seconds / 3600
        
        return (String(format: "%02d:%02d", hours, minutes))
    }
    class func timeFormatFromSeconds (seconds : Double) -> String
    {
        let seconds = Int(seconds)
        let sec: Int = seconds % 60
        let minutes: Int = (seconds / 60) % 60
        let hours: Int = seconds / 3600
        
        print(String(format: "%02d:%02d:%02d", hours, minutes, sec))
        
        if hours == 12
        {
            return (String(format:"%02d:%02d PM", hours, minutes))
            
        }else if hours > 12
        {
            if hours == 24
            {
                return (String(format:"00:%02d AM", minutes))
                
            }else{
                return (String(format:"%02d:%02d PM", hours - 12 , minutes))
            }
        }else{
            
            return (String(format:"%02d:%02d AM", hours , minutes))
        }
    }
    class func ConvertDateToUTC(date: NSDate) -> NSDate
    {
        let timeZoneOffset = Double(NSTimeZone.local.secondsFromGMT())// as TimeInterval
        let interval = date.timeIntervalSince1970 + timeZoneOffset
        return Date(timeIntervalSince1970: interval) as NSDate
    }
    class func getTimeStampInTimeStamp(datetimestamp : NSDate) -> Int64
    {
        let calender = NSCalendar.current
        
        let Cur_Date = calender.startOfDay(for: datetimestamp as Date)
        
        print(Cur_Date)
        
        print(Cur_Date.timeIntervalSince1970.description)
        
        return Int64(Cur_Date.timeIntervalSince1970)
    }
    class func daysBetweenDates(estiDate : Date,endDate: Date) -> Int
    {
        let calendar: Calendar = Calendar.current
        let date1 = calendar.startOfDay(for: estiDate) //Date())
        let date2 = calendar.startOfDay(for: endDate)
        return calendar.dateComponents([.day], from: date1, to: date2).day!
    }
    class func daySuffix(from_date: NSDate) -> String
    {
        let calendar = Calendar.current
        
        let fmDate = DateFormatter()
        fmDate.dateFormat = "MMM, YYYY" //"dd-MM-YYYY"
        // fmDate.string(from: dateTime as Date)
        
        let fmDateday = DateFormatter()
        fmDateday.dateFormat = "dd"//"dd-MM-YYYY"
        // fmDateday.string(from: dateTime as Date)
        
        let fmdayDate = DateFormatter()
        fmdayDate.dateFormat = "dd-MM-YYYY"
        
        var prefix = ""
        
        let dayOfMonth = calendar.component(.day, from: from_date as Date)
        switch dayOfMonth {
        case 1, 21, 31: prefix = "st"
        case 2, 22: prefix = "nd"
        case 3, 23: prefix = "rd"
        default: prefix = "th"
        }
        
        
        let days = Utilities.daysBetweenDates(estiDate: from_date as Date, endDate: NSDate() as Date)
        
        print(days)
        
        
        if days == 0
        {
            return "Today"
            
        }else if days == 1
        {
            return "Yesterday"
            
        }else{
            return fmDateday.string(from: from_date as Date) + prefix + " " + fmDate.string(from: from_date as Date)
        }
    }
    class func dateformatwithtime(from_date: NSDate) -> String
    {
        let calendar = Calendar.current
        
        let fmDate = DateFormatter()
        fmDate.dateFormat = "MMM YYYY" //"dd-MM-YYYY"
        // fmDate.string(from: dateTime as Date)
        
        let fmDateday = DateFormatter()
        fmDateday.dateFormat = "dd"//"dd-MM-YYYY"
        // fmDateday.string(from: dateTime as Date)
        
        var prefix = ""
        
        let dayOfMonth = calendar.component(.day, from: from_date as Date)
        switch dayOfMonth {
        case 1, 21, 31: prefix = "st"
        case 2, 22: prefix = "nd"
        case 3, 23: prefix = "rd"
        default: prefix = "th"
        }
        //hh:mm a,
        
        let fmDatetime = DateFormatter()
        fmDatetime.dateFormat = "hh:mm a,"
        
        return fmDatetime.string(from: from_date as Date) + " " + fmDateday.string(from: from_date as Date) + prefix + " " + fmDate.string(from: from_date as Date)
    }
    class func getFormatedDateInStringDashed(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd/MM/YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedDateInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "YYYY-MM-dd"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedmonthDateInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd MMM"//"dd-MM-YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedDateValueInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd"//"dd-MM-YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedMonthValueInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "MMM"//"dd-MM-YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedTransactionDateInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd MMM hh:mm a"//"dd-MM-YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedmonthStringDateInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd/MM"//"dd-MM-YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func getFormatedDateYearInString(dateTime : NSDate) -> String
    {
        let fmDate = DateFormatter()
        fmDate.dateFormat = "dd MMM, YYYY"
        return fmDate.string(from: dateTime as Date)
    }
    class func GetDatefromString(str : String) -> NSDate
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.date(from: str)! as NSDate
    }
    class func secondsToHoursMinutesSeconds (seconds : Double) -> (Int, Int, Int)
    {
        let (hr,  minf) = modf (seconds / 3600)
        let (min, secf) = modf (60 * minf)
        return (Int(hr), Int(min), 60 * Int(secf))
    }
    class func minutesToHoursMinutes(minutes_str : Int) -> (hours: Int, minutes: Int)
    {
        return (minutes_str / 60, (minutes_str % 60))
    }
    class func getTodayMorningTimeStamp() -> Double
    {
        let date = Date()
        
        var calendar = Calendar.current
        
        // calendar.timeZone =  TimeZone(abbreviation: "GMT")!
        
        calendar.timeZone =  TimeZone.current
        
        let hour = calendar.component(.hour, from: date)
        
        let min = calendar.component(.minute, from: date)
        
        let sec = calendar.component(.second, from: date)
        
        let dateTimeStamp = Int(date.timeIntervalSince1970) - (hour * 3600) - (min * 60) - sec
        
        return Double(dateTimeStamp)
    }
    class func getDateStringFromTimeStampWithFormat(timeStamp : Double, format : String) -> String
    {
        let fmDate = DateFormatter()
        let date = NSDate(timeIntervalSince1970: timeStamp)
        fmDate.timeZone = TimeZone.current
        fmDate.dateFormat = format
        fmDate.amSymbol = "AM"
        fmDate.pmSymbol = "PM"
        return fmDate.string(from: date as Date)
    }
    class func TrimingString (str : String)-> String
    {
        let cleanString = str.trimmingCharacters(in: CharacterSet.whitespaces)
        //let cleanString = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        return cleanString
    }
    
    class func getMondayMorningTimeStamp() -> Double
    {
        let date = Date()
        
        var calendar = Calendar.current
        
        //  calendar.timeZone =  TimeZone(abbreviation: "GMT")!
        calendar.timeZone =  TimeZone.current
        
        var comps = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: date)
        
        comps.weekday = 2 // Monday
        
        let mondayInWeek = calendar.date(from: comps)!
        
        let hour = calendar.component(.hour, from: mondayInWeek)
        
        let min = calendar.component(.minute, from: mondayInWeek)
        
        let sec = calendar.component(.second, from: mondayInWeek)
        
        let dateTimeStamp = Int(mondayInWeek.timeIntervalSince1970) - (hour * 3600) - (min * 60) - sec
        
        return Double(dateTimeStamp)
    }
    
    //MARK:  - RETURN TIMESTAMP FROM DATE STRING -
    class func getTimeStamp (date: String, dateFormat: String) -> Double
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = NSTimeZone.local //TimeZone(identifier: "UTC")
        
        let date: Date? = dateFormatter.date(from: date)
        let since1970: TimeInterval? = date?.timeIntervalSince1970
        
        return since1970!
    }
    
    //MARK: - Resize Image  -
    class func resize(_ image: UIImage) -> UIImage
    {
        var actualHeight: Float = Float(image.size.height)
        var actualWidth: Float = Float(image.size.width)
        let maxHeight: Float = 500.0
        let maxWidth: Float = 500.0
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight
        let compressionQuality: Float = 0.5
        //50 percent compression
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        let imageData: Data? = UIImage.jpegData(img!)(compressionQuality: CGFloat(compressionQuality))//UIImageJPEGRepresentation(img!, CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        return UIImage(data: imageData!)!
    }
    class func resizeImage(_ image: UIImage,withSize : CGFloat) -> UIImage
    {
        let size = image.size
        let targetSize : CGSize = CGSize(width: withSize, height: withSize)
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio)
        {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        }
        else
        {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    class func generateThumbnail(path: URL) -> UIImage
    {
        do
        {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        }
        catch let error
        {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return UIImage()
        }
    }
    
    //MARK: - Decode QR Code from Image -
    class func DecodeQRcodeFromImage(qrcodeImg: UIImage) -> String
    {
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy : CIDetectorAccuracyHigh])
        
        var decodeString = ""
        
        let ciImage = CIImage(image: qrcodeImg)
        
        var qrCodeLink = ""
        
        let features = detector?.features(in: ciImage!)
        for feature in features as! [CIQRCodeFeature]
        {
            qrCodeLink += feature.messageString!
        }
        
        if qrCodeLink==""
        {
            print("nothing")
            return decodeString
        }
        else
        {
            print("message: \(qrCodeLink)")
            decodeString = qrCodeLink
            return decodeString
        }
    }
    
    
    //MARK: - Operation with View -
    class func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    class func BorderForCellView(view : UIView)
    {
        let shadowView = view//UIView(frame: view.frame)
        shadowView.layer.shadowColor = UIColor(red:64.0/255.0 , green: 74.0/255.0, blue: 92.0/255.0, alpha: 1.0).cgColor
        
        shadowView.layer.shadowOffset = CGSize()
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 2
        shadowView.layer.cornerRadius = 5.0
        
        let view = UIView(frame: shadowView.bounds)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5.0//10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.5
        view.clipsToBounds = true
        
        //shadowView.addSubview(view)
        view.sendSubviewToBack(shadowView)//(toFront: view)
        //superview.addSubview(shadowView)
    }
    class func BorderToInnerview(view: UIView, cornerrounds : [UIRectCorner]) -> CALayer
    {
        let path = UIBezierPath(roundedRect:view.bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: 5, height:  5))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        
        return maskLayer
        
    }
    class func BorderForView(view : UIView)
    {
        // view.layer.cornerRadius = 8.0
        view.layer.borderColor = UIColor(red: 228.0/255.0, green: 234.0/255.0, blue: 238.0/255.0, alpha: 1.0).cgColor
        view.layer.borderWidth = 1.0
        view.clipsToBounds = true
        //Enable if you want to set border radius
        //view.layer.cornerRadius = view.frame.height / 2
    }
    class func giveShadow(view : UIView)
    {
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        let shadowPath = UIBezierPath(rect: view.bounds)
        view.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.10).cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 4
        view.layer.shadowOpacity = 1.0
        view.layer.shadowPath = shadowPath.cgPath
    }
    
    //MARK: - Get Country Code -
    class func LocaleCountryCode() -> String
    {
        let currentLocale = Locale.current as NSLocale
        
        let strcode = currentLocale.object(forKey: .countryCode)
        
        return strcode as? String ?? ""
    }
    
    //MARK: - File Manager Operation -
    class func createDirecotyWithFolderName(folderName: String) -> Bool
    {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        //let documentsDirectory: AnyObject = paths[0] as AnyObject
        let documentsDirectory = paths[0] as NSString
        let dataPath = documentsDirectory.appendingPathComponent(folderName)
        
        do {
            try FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
            return true
        } catch let error as NSError {
            print(error.localizedDescription);
            return false
        }
    }
    class func isFileExistsInDirectory(filepath:String) -> Bool
    {
        return FileManager.default.fileExists(atPath: filepath)
    }
    class func getFolderPathInDocumentDirectoryWithFolderName(folderName: String) -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        
        let dataPath = documentsDirectory.appendingPathComponent(folderName)
        
        return dataPath
    }
    class func saveImageLocalDirectory(image:UIImage ,imageName : String) -> String
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // choose a name for your image
        let fileName = imageName
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if let data = image.jpegData(compressionQuality: 1.0),
            !FileManager.default.fileExists(atPath: fileURL.path)
        {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
        
        return fileURL.absoluteString
    }
    
    class func getDateInString(timeStamp : Double) -> String //history (Tow user)
    {
        let fmDate = DateFormatter()
        fmDate.timeZone = NSTimeZone.local
        let date = NSDate(timeIntervalSince1970: timeStamp)
        fmDate.dateFormat = "MMMM dd, yyyy"
        /*fmDate.dateFormat = "dd MMM"
        
        let temp1 = fmDate.string(from: date as Date)
        
        fmDate.dateFormat = "yy"
        
        let temp2 = fmDate.string(from: date as Date)*/
        return fmDate.string(from: date as Date)//temp1 + "'" + temp2
    }
    
    class func validatemobilenumber(text : String)  -> Bool
    {
        if text.count < 7 || text.count > 16
        {
            return false
        }
        return true
    }
    
    class func getTimeInString(timeStamp : Double) -> String
    {
        let fmDate = DateFormatter()
        let date = NSDate(timeIntervalSince1970: timeStamp)//NSDate(timeIntervalSince1970: timeStamp)
        print(date)
        
        fmDate.dateFormat = "yyyy-dd-MM HH:mm:ss +zzzz"
        fmDate.timeZone = TimeZone.current//TimeZone(identifier: "UTC")
        fmDate.locale = Locale.current
        
        
        fmDate.dateFormat = "h:mm a"
        
        //fmDate.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        
        return fmDate.string(from: date as Date)
    }
    
    //MARK: - FUNCTION NOTIFICATION TIME  -
    class func notificationTime(notiTimeStamp: Double) -> String
    {
        var seconds: Double = 0.0
        var minutes: Double = 0.0
        var hours: Double = 0.0
        var days: Double = 0.0
        
        var secondString : String?
        var minuteString : String = ""
        var hourString : String = ""
        var dayString : String = ""
        var finalString : String = ""
        
        let difference = Date().timeIntervalSince1970 - notiTimeStamp
        
        /*if (difference < 0)
         {
         difference = difference - (2*difference)
         }*/
        
        if (difference > 0)
        {
            seconds = difference
            if (seconds > 60.0)
            {
                minutes = seconds / 60.0
                
                if (minutes > 60.0)
                {
                    hours = minutes / 60.0
                    
                    if (hours > 24.0)
                    {
                        days = hours / 24.0
                        
                        if (days > 1.0 && days < 2.0)
                        {
                            
                            return "Yesterday"//finalString
                        }
                        else
                        {
                            if (days > 1.0 )
                            {
                                
                                let date = Utilities.getDateInString(timeStamp: notiTimeStamp)
                                
                                finalString = date// + " at " + time
                                return finalString
                            }
                            else
                            {
                                let d = Int(days)
                                dayString = d.description + " " + "days ago"
                                return dayString
                            }
                            
                        }
                    }
                    else
                    {
                        let h = Int(hours)
                        hourString = h.description + " " + "hours ago"
                        return hourString
                    }
                }
                else
                {
                    let min = Int(minutes)
                    minuteString = min.description + " " + " minutes ago"
                    return minuteString
                }
            }
            else
            {
                let s = Int(seconds)
                secondString = s.description + " seconds ago"
                return secondString!
            }
        }
        else
        {
            return "1 second ago"
        }
    }
    //Chat/Comment and Notification Time format
    class func timeElapsed(from : Double) -> String
    {
        let seconds = Date().timeIntervalSince1970 - from
        let minutes: Int = Int(seconds)/60
        let hours: Int = minutes/60
        let days: Int = hours/24
        let months: Int = days/30
        let years: Int = months/12
        
        var timeElapsedInString: String = "moments ago"
        
        if years >= 1
        {
            if years == 1
            {
                timeElapsedInString = "a year ago"
            }
            else
            {
                timeElapsedInString = String(years) + " " + "a year ago"
            }
        }
        else
        {
            if months >= 1
            {
                if months == 1
                {
                    timeElapsedInString = "month ago"
                }
                else
                {
                    timeElapsedInString = String(months) + " " + "months ago"
                }
            }
            else
            {
                if days >= 1
                {
                    if days == 1
                    {
                        timeElapsedInString = "Yesterday"
                    }
                    else
                    {
                        timeElapsedInString = String(days) + " " + "days ago"
                    }
                }
                else
                {
                    if hours >= 1
                    {
                        if hours == 1
                        {
                            //timeElapsedInString = String(hours) + " " + "An hour ago"
                            timeElapsedInString = " an hour ago"
                        }
                        else
                        {
                            timeElapsedInString = String(hours) + " " + "hours ago"
                        }
                    }
                    else
                    {
                        if minutes > 0
                        {
                            if minutes == 1
                            {
                                timeElapsedInString = String(minutes) + " " + "minute ago"
                            }
                            else
                            {
                                timeElapsedInString = String(minutes) + " " + "minutes ago"
                            }
                        }
                        else
                        {
                            timeElapsedInString = String(Int(seconds)) + " seconds ago"
                        }
                    }
                }
            }
        }
        return timeElapsedInString
    }
    
//    class func showToast(text:String, view: UIView)
//    {
//        view.makeToast(text, duration: 2.0, position: .top)
//    }
    
    //MARK: - For normal textfield without image
    class func txtStartWithoutImage (view: UIView)
    {
        view.backgroundColor = UIColor(hexString: "#EE4136")
    }
    
    class func txtStopWithoutImage (view: UIView)
    {
        view.backgroundColor = UIColor(hexString: "#EE4136")
    }
    
    //MARK: - TEXTFIELD DID BEGIN METHOD -
    class func txtBegin(view:UIView, imgView: UIImageView, img: UIImage)
    {
        view.backgroundColor = appConfig.appColors.viewBGColor
        view.layer.cornerRadius = view.layer.frame.height / 2
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.borderWidth = 1.0
        imgView.image = img
    }
    
    //MARK: - TEXTFIELD DID END METHOD -
    class func txtEnd(view: UIView, imgView: UIImageView, img: UIImage, tf: UITextField, imgEmpty: UIImage)
    {
        view.layer.borderColor = appConfig.appColors.viewSelectedColor.cgColor
        view.layer.cornerRadius = view.layer.frame.height / 2
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1.0
        
        if (tf.text?.count == 0)
        {
            imgView.image = imgEmpty
        }
        else
        {
            imgView.image = img
        }
    }
}

extension UIView
{
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
