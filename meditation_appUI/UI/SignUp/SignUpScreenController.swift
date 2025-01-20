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
    
    @IBOutlet weak var userNameTextField: ValidationTextField!
    @IBOutlet weak var emailTextField: ValidationTextField!
    @IBOutlet weak var CreateLabel: UILabel!
    @IBOutlet weak var passWordTextField: UIFlatTextField!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func backDidTaped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func facebookSignInButton(_ sender: Any) {
        AuthService.shared.signUpWithGoogle(withPresenting: self) { authResults, error in
            if let error = error{
                print("Dang nhập không thành công với lỗi\(error)")
                return
            }
            print("Đăng nhập thành công")
        }
    }
    
    @IBAction func googleSignInButtonTapped(_ sender: Any) {
        AuthService.shared.signUpWithGoogle(withPresenting: self) { authResults, error in
            if let error = error{
                print("Dang nhap  khong thanh cong với\(error)")
                return
            }
            print("Đăng nhập thành công")
        }
        print("hellp button is tapped")
    }
    private func setUpView(){
        CreateLabel.font = CreateLabel.font.withSize(24)
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passWordTextField.delegate = self
        hideKeyboard()
        IQKeyboardManager.shared.isEnabled = true
        checkBoxTap()
    }
    
    @objc  func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func checkBoxTap(){
        checkBoxImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleImage))
        checkBoxImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func toggleImage(){
        checkBoxImageView.image = UIImage(systemName: isChecked ? "square" : "checkmark.square.fill")
        isChecked.toggle()
    }
}

