//
//  ValidationManager.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 21/1/25.
//

import Foundation

class ValidationManager{
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidUsername(_ username: String) -> Bool {
        let usernameRegex = "^[A-Za-z0-9_]{3,16}$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernamePredicate.evaluate(with: username)
    }
        
}
