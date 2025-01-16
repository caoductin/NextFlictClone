//
//  SignUpScreenController+TextFieldDelegate.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 16/1/25.
//

import Foundation
import UIKit

extension SignUpScreenController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField{
            EmailTextField.becomeFirstResponder()
        }
        else if textField == EmailTextField{
            passWordTextField.becomeFirstResponder()
        }
        else if textField == passWordTextField{
            passWordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if userNameTextField == userNameTextField{
            if let userName = userNameTextField.text, !userName.isEmpty{
                
                toogleImageRightView(userNameTextField,true, rightViewImage: "correctIcon")
            }
            else{
                toogleImageRightView(userNameTextField,true, rightViewImage: "close")
            }
        }
        
        if EmailTextField == EmailTextField{
            if let email = EmailTextField.text,isValidEmail(email){
                toogleImageRightView(EmailTextField, true, rightViewImage: "correctIcon")
            }
            else{
                toogleImageRightView(EmailTextField, true, rightViewImage: "close")
            }
        }
    }
}
