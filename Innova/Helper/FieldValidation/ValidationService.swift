//
//  ValidationService.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit
/// ValidationParam Declaration. Check Example in Quick Help Section
///
///
///     let ValidateForm: ValidationParam =
///     [
///     .REQ_EMAIL: (0,txtEmail),
///     .VALID_EMAIL: (1,txtEmail),
///     .REQ_PASSWORD: (2,txtPassword),
///     .VALID_PASSWORD: (3,txtPassword),
///     .REQ_CONFIRM_PASS: (4,txtConfirmPassword),
///     ]
///
///     print(ValidateForm)
///
typealias ValidationParam = [validationType: (priority: Int,fieldToValidate: UITextField)]
enum validationType : String
{
    case REQ_NAME           = "reqName"
    case REQ_FULLNAME       = "reqFullName"
    case REQ_FIRSTNAME      = "reqFirstName"
    case REQ_LASTNAME       = "reqLastName"
    case REQ_EMAIL          = "reqEmail"
    case REQ_EMAIL_Mobile   = "reqEmailMobile"
    case REQ_PASSWORD       = "reqPassword"
    case REQ_NEW_PASSWORD   = "reqNewPassword"
    case REQ_CONFIRM_PASS   = "reqConfirmPass"
    case REQ_COUNTRYCODE    = "reqCountryCode"
    case REQ_MOBILE         = "reqMobile"
    case REQ_PIN            = "reqPin"
    case REQ_PIN2           = "reqPin2"
    case REQ_PIN3           = "reqPin3"
    case REQ_PIN4           = "reqPin4"
    case REQ_OTP            = "reqOtp"
    case REQ_OTP2           = "reqOtp2"
    case REQ_OTP3           = "reqOtp3"
    case REQ_OTP4           = "reqOtp4"
    case REQ_LOCATION       = "reqLocation"
    case REQ_SUBJECT        = "reqSubject"
    case REQ_MESSAGE        = "reqMessage"
    
    case VALID_EMAIL        = "validEmail"
    case VALID_PASSWORD     = "validPassword"
    case VALID_MOBILE       = "validMobile"
    case VALID_MOBILESIGNIN = "validMobileSignIn"
    case VALID_URL          = "validUrl"
    //case VALID_PIN          = "validPin"
    
    case COMPARE_FIELD      = "compareField"
    case COMPARE_EMAIL      = "compareEmail"
    
    case ContainWhiteSpace  = "space"
}
/// FieldValidation Declaration. Check Example in Quick Help Section
///
///
/// **Normal parameter validation of screen**
///
///     let ValidateForm: ValidationParam =
///     [
///     .REQ_NAME: (0,txtFullName),
///     .REQ_EMAIL: (1,txtEmail),
///     .VALID_EMAIL: (2,txtEmail),
///     .REQ_PASSWORD: (3,txtPassword),
///     .VALID_PASSWORD: (4,txtPassword)
///     ]
///
///     if FieldValidation(fieldName: ValidateForm)
///     {
///         print("success")
///     }
///
/// **Validation with Compare Validation of screen**
///
///     let ValidateForm: ValidationParam =
///     [
///     .REQ_EMAIL: (0,txtEmail),
///     .VALID_EMAIL: (1,txtEmail),
///     .REQ_PASSWORD: (2,txtPassword),
///     .VALID_PASSWORD: (3,txtPassword),
///     .REQ_CONFIRM_PASS: (4,txtConfirmPassword),
///     ]
///
///     print(ValidateForm)
///
///     if FieldValidation(fieldName: ValidateForm, Compare: (CompareField: txtPassword, CompareFieldTo: txtConfirmPassword))
///     {
///         print("success")
///     }
///
func FieldValidation(fieldName: ValidationParam, Compare: (CompareField: UITextField, CompareFieldTo: UITextField)? = nil) -> (isSuccess: Bool, message: String)
{
    
    var valuess = fieldName.sorted(by: { (arg0, arg1) -> Bool in
        
        return arg0.value.priority < arg1.value.priority
    })
    
    //print(valuess)
    
    if Compare != nil
    {
        valuess.append((key: .COMPARE_FIELD, value: (valuess.count + 1, Compare?.CompareField ?? UITextField())))
    }
    
    for (key: valType, value: (priority: _,fieldToValidate: txtField)) in valuess
    {
        //txtField.textColor = appConfig.appColors.validationStringSuccess
        
        
        switch valType
        {
        case .REQ_NAME:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_NAME_EMPTY".localized)
            }
        case .REQ_FULLNAME:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_FULLNAME_EMPTY".localized)
            }
        case .REQ_FIRSTNAME:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_FIRSTNAME_EMPTY".localized)
            }
        case .REQ_LASTNAME:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_LASTNAME_EMPTY".localized)
            }
        case .REQ_EMAIL:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_EMAIL_EMPTY".localized)
            }
        case .REQ_EMAIL_Mobile:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_EMAIL_MOBILE".localized)
            }
        case .REQ_PASSWORD:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_PASSWORD_EMPTY".localized)
            }
        case .REQ_CONFIRM_PASS:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_CONFIRM_PASSWORD_EMPTY".localized)
            }
        case .REQ_NEW_PASSWORD:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_NEW_PASSWORD_EMPTY".localized)
            }
        case .REQ_MOBILE:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_MOBILE_NUMBER_EMPTY".localized)
            }
        case .REQ_COUNTRYCODE:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_SELECT_COUNTRY_CODE".localized)
            }
        case .REQ_PIN, .REQ_PIN2, .REQ_PIN3, .REQ_PIN4:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_PIN_EMPTY".localized)
            }
        case .REQ_OTP, .REQ_OTP2, .REQ_OTP3, .REQ_OTP4:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_ENTER_VALID_OTP_CODE".localized)
            }
        case .REQ_LOCATION:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_LOCATION_EMPTY".localized)
            }
        case .REQ_SUBJECT:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_SUBJECT_EMPTY".localized)
            }
        case .REQ_MESSAGE:
            if(txtField.text?.trim() == "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_COMMENT_EMPTY".localized)
            }
        case .VALID_EMAIL:
            if txtField.text?.trim() != ""
            {
                if !Utilities.isValidEmail(testStr: (txtField.text?.trim())!)
                {
                    txtField.becomeFirstResponder()
                    return (false, "MSG_EMAIL_INVALID".localized)
                }
            }
        case .VALID_PASSWORD:
            if txtField.text?.trim().count != 0
            {
                if !Utilities.isValidPassword(testStr: (txtField.text?.trim())!)
                {
                    txtField.becomeFirstResponder()
                    return (false, "MSG_PASSWORD_INVALID".localized)
                }
            }
        case .VALID_MOBILE:
            if txtField.text?.trim().count != 0
            {
                if !Utilities.isValidMobileNumber(testStr: (txtField.text?.trim())!)
                {
                    txtField.becomeFirstResponder()
                    return (false, "MSG_INVALID_MOBILENO".localized)
                }
            }
        case .VALID_MOBILESIGNIN:
            if txtField.text?.trim().count != 0
            {
                if !Utilities.isValidMobileNumber(testStr: (txtField.text?.trim())!)
                {
                    txtField.becomeFirstResponder()
                    return (false, "MSG_MOBILE_INVALID".localized)
                }
            }
        case .COMPARE_FIELD:
            if Compare?.CompareField.text?.trim() != Compare?.CompareFieldTo.text?.trim()
            {
                Compare?.CompareField.becomeFirstResponder()
                return (false, "MSG_CONFIRM_PASSWORD_MISSMATCH".localized)
            }
            
        case .ContainWhiteSpace:
            break
        case .VALID_URL:
            if !Utilities.isValidateURL(stringURL: txtField.text?.trim() ?? "")
            {
                txtField.becomeFirstResponder()
                return (false, "MSG_URL_IS_NOT_VALID".localized)
            }
            
        case .COMPARE_EMAIL:
            break
        }
    }
    return (true, "Success")
}
