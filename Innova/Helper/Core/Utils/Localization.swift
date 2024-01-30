//
//  Localization.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit
/**
 *  Localizable Protocol
 */
public protocol Localizable: AnyObject {
    
    /// The property that can be localized for each view, for example in a UILabel its the text, in a UIButton its the title, etc
    var localizableProperty: String? { get set }
    
    /// The localizable string value in the your localizable strings
    var localizableString: String { get set }
    
    /**
     Applies the localizable string to the supported view attribute
     */
    func applyLocalizableString(_ localizableString: String?) -> Void
    
}
extension Localizable{
    
    /**
     Applies the localizable string to the supported view attribute
     
     - parameter localizableString: localizable String Value
     */
    public func applyLocalizableString(_ localizableString: String?) -> Void {
        
        self.localizableProperty = localizableString?.localized
        
    }
}

// MARK: - String extensions
extension String {
    
    /// Returns the localized string value
    public var localized: String {
        return localize(withBundle: AppDelegate.getBundle(AppDelegate.currentAppleLanguage()))
    }
    
    public func localize(withBundle bundle: Bundle) -> String
    {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
}

extension UIButton {
    
    public override var localizableProperty: String?{
        
        get{
            return self.currentTitle
        }
        set{
            self.setTitle(newValue, for: UIControl.State())
        }
    }
}

extension UILabel {
    
    public override var localizableProperty: String?{
        
        get{
            return self.text
        }
        set{
            self.text = newValue
        }
    }
    
}

extension UINavigationItem: Localizable {
    
    public var localizableProperty: String?{
        get{
            return self.title
        }
        set{
            self.title = newValue
        }
    }
    
    @IBInspectable public var localizableString: String{
        
        get{
            guard let text = self.localizableProperty else{
                return ""
            }
            return text
        }
        set{
            applyLocalizableString(newValue)
        }
        
    }
    
    
}

extension UITextField {
    
    @objc public override var localizableProperty: String?{
        
        get{
            return self.placeholder
        }
        set{
            self.placeholder = newValue
        }
    }
    
}

extension UITextView{
    
    public override var localizableProperty: String?{
        
        get{
            return self.text
        }
        set{
            self.text = newValue
        }
    }
}

extension UIBarItem: Localizable {
    
    public var localizableProperty: String?{
        get{
            return self.title
        }
        set{
            self.title = newValue
        }
    }
    
    @IBInspectable public var localizableString: String{
        
        get{
            guard let text = self.localizableProperty else{
                return ""
            }
            return text
        }
        set{
            applyLocalizableString(newValue)
        }
        
    }
}

extension UIView : Localizable {
    
    /// Not implemented in base class
    @objc public var localizableProperty: String?{
        get{
            return ""
        }
        set{}
    }
    
    @IBInspectable public var localizableString: String{
        
        get{
            guard let text = self.localizableProperty else{
                return ""
            }
            return text
        }
        set{
            /**
             *  Applys the localization to the property
             */
            applyLocalizableString(newValue)
        }
    }
    
    //initializer for programatic use
    convenience init(_ localizableString: String,_ frame: CGRect) {
        
        self.init(frame: frame)
        self.localizableString = localizableString
    }
    
}

extension UISearchBar {
    
    @objc public override var localizableProperty: String?{
        
        get{
            return self.placeholder
        }
        set{
            self.placeholder = newValue
        }
    }
}



