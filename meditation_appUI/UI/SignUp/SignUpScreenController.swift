//
//  SignUpScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
class SignUpScreenController: BaseViewController {
    
    
    @IBOutlet weak var googleSignInButton: GoogleSignInButton!
    @IBOutlet weak var facebookSignInButton: FacebookSignInButton!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var userNameTextField: ValidationTextField!
    @IBOutlet weak var emailTextField: ValidationTextField!
    @IBOutlet weak var passWordTextField: UIFlatTextField!
    @IBOutlet weak var checkBoxView: CheckBoxView!
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func facebookSignInButton(_ sender: Any) {
        facebookSignInButton.configuration?.showsActivityIndicator = true
        AuthService.shared.signUpWithGoogle(withPresenting: self) { authResults, error in
            self.facebookSignInButton.configuration?.showsActivityIndicator = false
            if let error = error{
                print("Dang nhập không thành công với lỗi\(error)")
                return
            }
            print("Đăng nhập thành công")
        }
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        guard let email = userNameTextField.text, !email.isEmpty,
              let password = passWordTextField.text, !password.isEmpty else {
            showAlert(title: "sign up", message: "khong để fill này rỗng đc")
            return
        }
        SignUpButton.configuration?.showsActivityIndicator = true
        AuthService.shared.signupWithEmail(email: email, password: password) { authResults, error in
            if let error = error {
                self.SignUpButton.configuration?.showsActivityIndicator = false
                self.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            print("dang nhpa thanh cong")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func googleSignInButtonTapped(_ sender: Any) {
        googleSignInButton.configuration?.showsActivityIndicator = true
        AuthService.shared.signUpWithGoogle(withPresenting: self) { authResults, error in
            self.googleSignInButton.configuration?.showsActivityIndicator = false
            if let error = error{
                print("Dang nhap  khong thanh cong với\(error)")
                return
            }
            print("Đăng nhập thành công")
        }
    }
    
    private func setUpView(){
        headerLabel.font = headerLabel.font.withSize(24)
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passWordTextField.delegate = self
        IQKeyboardManager.shared.isEnabled = true
    }
    
    @objc  func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


