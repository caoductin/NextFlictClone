//
//  SignUpScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit
class SignUpScreenController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!

    @IBOutlet weak var CreateLabel: UILabel!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        checkBoxTaped()
        setupUI()
        togglePasswordTaped()
        //  IQKeyboardManager.shared.isEnabled = true
        hideKeyboard()
        userNameTextField.delegate = self
        EmailTextField.delegate = self
        passWordTextField.delegate = self
    }
   @IBAction func backDidTaped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    @objc  func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func togglePasswordVisibility() {
        passWordTextField.isSecureTextEntry.toggle()
        let imageName = passWordTextField.isSecureTextEntry ? "view" : "hide"
        
        let rightView = createPaddingView( imageName: imageName, imageSize: CGSize(width: 24, height: 24), paddingSize: CGSize(width: 40, height: 40) )
        
        passWordTextField.rightView = rightView
        passWordTextField.rightViewMode = .always
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
        rightView.isUserInteractionEnabled = true
        rightView.addGestureRecognizer(tapGesture)

    }
    
    @objc func toggleImage() {
        if isChecked {
            checkBoxImageView.image = UIImage(named: "checkbox")
        } else {
            checkBoxImageView.image = UIImage(named: "checkboxTick")
        }
        isChecked.toggle()
    }
    
    
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
    
}

