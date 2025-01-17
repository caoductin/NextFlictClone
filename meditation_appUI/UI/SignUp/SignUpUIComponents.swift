//
//  SignUpUIComponents.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 15/1/25.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

extension SignUpScreenController {
    func setupUI() {
        CreateLabel.font = AppTheme.mainFont.withSize(24)
        
        configureTextField(EmailTextField, cornerRadius: 10, rightViewImage: "correctIcon",showRightImage: false)
        configureTextField(userNameTextField, cornerRadius: 10, rightViewImage: "correctIcon",showRightImage: false)
        configureTextField(passWordTextField, cornerRadius: 10, rightViewImage: "view",showRightImage: true)
        IQKeyboardManager.shared.isEnabled = true
    }
    
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func checkBoxTaped() {
        checkBoxImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleImage))
        checkBoxImageView.addGestureRecognizer(tapGesture)
    }
    
    func togglePasswordTaped() {
        if let rightView = passWordTextField.rightView {
            rightView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
            rightView.addGestureRecognizer(tapGesture)
        }
    }
    
    func configureTextField(_ textField: UITextField, cornerRadius: CGFloat, rightViewImage: String?, showRightImage: Bool) {
        textField.borderStyle = UITextField.BorderStyle.none
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = cornerRadius
        textField.layer.masksToBounds = true
        toogleImageRightView(textField, showRightImage, rightViewImage:  rightViewImage)
    }
    
    func toogleImageRightView(_ textField : UITextField,_ showRightImage: Bool,rightViewImage: String?){
        if showRightImage, let imageName = rightViewImage {
            textField.rightView = createPaddingView(imageName: imageName, imageSize: CGSize(width: 18, height: 18), paddingSize: CGSize(width: 40, height: 40))
            textField.rightViewMode = .always
        } else {
            textField.rightView = nil
            textField.rightViewMode = .never
        }
    }
    
    func createPaddingView(imageName: String, imageSize: CGSize, paddingSize: CGSize) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingSize.width, height: paddingSize.height))
        paddingView.addSubview(imageView)
        imageView.center = CGPoint(x: paddingView.frame.size.width / 2, y: paddingView.frame.size.height / 2)
        return paddingView
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
