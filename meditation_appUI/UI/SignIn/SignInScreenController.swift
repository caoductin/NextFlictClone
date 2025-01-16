//
//  SignInScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import IQKeyboardManagerSwift
import UIKit

class SignInScreenController: UIViewController {
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var facebookSignInButton: FacebookSignInButton!
    @IBOutlet var googleSignInButton: GoogleSignInButton!
    @IBOutlet var passwordTextField: UIFlatTextField!
    @IBOutlet var emailTextField: UIFlatTextField!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    private lazy var emailFieldDelegate = EmailFieldDelegate()
    private lazy var passwordFieldDelegate = EmailFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        settupView()
        IQKeyboardManager.shared.isEnabled = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func signInDidTapped(_ button: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        button.configuration?.showsActivityIndicator = true
        button.isEnabled = false
        AuthService.shared.signupWithEmail(email: email, password: password) { result, error in
            button.configuration?.showsActivityIndicator = false
            button.isEnabled = true
            if let error {
                self.showError(error: error)
                return
            }
            if let result {}
        }
    }

    func showError(error: Error) {
        let aleart = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        aleart.addAction(action)
        present(aleart, animated: true)
    }

    func settupView() {
        headerLabel.font = headerLabel.font.withSize(28)
        emailTextField.delegate = emailFieldDelegate
        passwordTextField.delegate = passwordFieldDelegate
        signUpButton.titleLabel?.font = signUpButton.titleLabel?.font.withSize(14)
    }
}

class EmailFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

class PasswordFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
