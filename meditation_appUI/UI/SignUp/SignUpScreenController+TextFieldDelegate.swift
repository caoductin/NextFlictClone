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
        if textField == emailTextField{
            userNameTextField.becomeFirstResponder()
        }
        else if textField == userNameTextField{
            passWordTextField.becomeFirstResponder()
        }
        else if textField == passWordTextField{
            passWordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if let validationTextField = textField as? ValidationTextField {
            validationTextField.onTextChanged()
        }
    }
}

