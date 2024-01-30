//
//  GlobalFunction.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit

func saveDefault(withObject: AnyObject ,forkey:String)
{
    let deft = UserDefaults.standard
    deft.set(withObject, forKey: forkey)
    deft.synchronize()
}

func getDefault(forkey:String) -> AnyObject?
{
    let deft = UserDefaults.standard
    return (deft.value(forKey: forkey) as AnyObject?) ?? nil
}


func showErrorLabelinView(isshow: Bool = true, view: UIView, Message: String)
{
    for views in view.subviews
    {
        if views.accessibilityIdentifier == "errViewSub"
        {
            views.removeFromSuperview()
            //break
        }
    }
    if isshow
    {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 20, y: view.frame.size.height/2 - 30, width: view.frame.size.width - 40, height: 60)
        print(lbl.frame)
        lbl.font = UIFont(name: "PT Sans", size: 16.0)
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
    else
    {
        for views in view.subviews
        {
            if views.accessibilityIdentifier == "errViewSub"
            {
                views.removeFromSuperview()
                //break
            }
        }
    }
}
func addMessageLabelOnView(suprView:UIView, withMessage : String)
{
    removeAddedMessageLabel(suprView:suprView)
    
    DispatchQueue.main.async {
        let frm = suprView.bounds
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        label.font = UIFont.applyHelveticaNeueRegular(fontSize: 16)
        label.text = withMessage
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.accessibilityIdentifier = "messagelabelidentifier"
        //label.sizeToFit()
        let sizel =  withMessage.sizeForWidth(width: frm.width - 30, height: CGFloat.greatestFiniteMagnitude, font: label.font) //label.intrinsicContentSize
        label.frame = CGRect.init(x: 15, y: (frm.height - sizel.height)/2, width: frm.width - 30, height: sizel.height)
        suprView.addSubview(label)
        
        if let _scrView = suprView as? UIScrollView {
            if let _ = suprView.viewWithTag(-1) as? UIRefreshControl {return}
            _scrView.isScrollEnabled = false
        }
        
    }
}
func removeAddedMessageLabel(suprView:UIView)
{
    DispatchQueue.main.async {
        for subviw in suprView.subviews
        {
            if subviw.accessibilityIdentifier == "messagelabelidentifier"
            {
                subviw.removeFromSuperview()
                
                if let _scrView = suprView as? UIScrollView {
                    _scrView.isScrollEnabled = true
                }
            }
        }
    }
}


func checkTimeStamp(date: String!) -> Bool
{
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.locale = Locale(identifier:"en_US_POSIX")
    let datecomponents = dateFormatter.date(from: date)
    
    let now = Date()
    
    if (datecomponents! >= now) {
        return true
    } else {
        return false
    }
}


func getCurrentCountryCode()->String
{
    let locale = Locale.current
    let code = ((locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?)!
    return code //getCountryCallingCode(countryRegionCode: code)
}


func removeSubviewWith(fromView:UIView, accessibilityIdentifier : String)
{
    DispatchQueue.main.async {
        for subviw in fromView.subviews
        {
            if subviw.accessibilityIdentifier == accessibilityIdentifier
            {
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionCrossDissolve, animations: {
                    subviw.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
                }) { (done) in
                    subviw.removeFromSuperview()
                }
                
                
            }
        }
    }
}

func getResponseErrorMessage(err : NSArray)->String
{
    var dStr = ""
    if err.count > 0
    {
        dStr.append(err[0] as! String)
    }
    if err.count > 1
    {
        dStr.append(".\n")
        dStr.append(err[1] as! String)
    }
    if err.count > 2
    {
        dStr.append(".\n")
        dStr.append(err[2] as! String)
    }
    return dStr
}

func getCompareResponseErrorMessage(err : NSArray)->String
{
    var dStr = ""
    if err.count > 0
    {
        dStr.append(err[0] as! String)
    }
    
    return dStr
}



// MARK:- base 64
func encodeToBase64String(image: UIImage?) -> String? {
    return image!.pngData()?.base64EncodedString(options: .lineLength64Characters)
}

func decodeBase64ToImage(strEncodeData: String?) -> UIImage? {
    let data = Data(base64Encoded: strEncodeData ?? "", options: .ignoreUnknownCharacters)
    if let aData = data {
        return UIImage(data: aData)
    }
    return nil
}

func GetCurrentTimeStamp(time: String?) -> String? {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    df.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
    let date: Date? = df.date(from: time ?? "")
    let since1970: TimeInterval? = date?.timeIntervalSince1970
    // January 1st 1970
    let result = Double((since1970 ?? 0.0) * 1000)
    return "\(result)"
}

func GetDateFromTimeStamp(time: String?) -> String? {
    let _interval = TimeInterval(Double(time ?? "") ?? 0.0)
    let date = Date(timeIntervalSince1970: _interval)
    let _formatter = DateFormatter()
    _formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let _date = _formatter.string(from: date)
    return _date
}

func isIPhoneX() -> Bool {
    if UIDevice().userInterfaceIdiom == .phone {
        if UIScreen.main.nativeBounds.height == 2436 {
            return true
        }
    }
    
    return false
}
//Available in PBChatHelper.swift
func getDocumentsDirectory() -> URL? {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths.first
}

//Available in PBChatHelper.swift
func deleteFileAtPath(url : String){
    if url.isEmpty {return}
    
    do {
        try FileManager.default.removeItem(at: URL(string: url)!)
        print("File deleted successfully")
    }catch{
        print("1st attempt to delete is failed")
        do {try FileManager.default.removeItem(atPath: url)}catch{ print("2nd attempt to delete is failed")}
    }
}

//MARK: - Activity Indicator -
func showLoader()
{
    DispatchQueue.main.async {
        PbCircleDotLoader.sharedInstance.startAnimation()
    }
}
func hideLoader()
{
    DispatchQueue.main.async {
        PbCircleDotLoader.sharedInstance.stopAnimation()
    }
}






