//
//  AppTheme.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 14/1/25.
//

import Foundation
import UIKit
struct AppTheme {
    static let ButtonPrimaryColor = UIColor(named: "ButtonPrimaryColor")
    static let ButtonSecondaryColor = UIColor(named: "ButtonSecondaryColor")
    static let backgroundColor = UIColor(named: "backgroundColor")
    static let backgroudTextField = UIColor(named: "textFieldBG")
    static let textColor = UIColor(hex: "#3F414E")
    static let mainFont = UIFont(name: "Inter Variable", size: 14) ?? UIFont.systemFont(ofSize: 14)
    
    static func configureAppAppearance() {
        UILabel.appearance().font = mainFont
        UILabel.appearance().textColor = textColor
        
        UIButton.appearance().titleLabel?.font = mainFont
        UIButton.appearance().tintColor = ButtonPrimaryColor
    
        UITextField.appearance().font = mainFont
        UITextField.appearance().textColor = textColor
        UITextField.appearance().backgroundColor = backgroudTextField
    }
}
