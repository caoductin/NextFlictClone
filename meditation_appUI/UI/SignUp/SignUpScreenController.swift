//
//  SignUpScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit
class SignUpScreenController: BaseViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var CreateLabel: UILabel!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxTaped()
        setupUI()
        togglePasswordTaped()
        hideKeyboard()
        userNameTextField.delegate = self
        EmailTextField.delegate = self
        passWordTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        let rightView = createPaddingView( imageName: imageName, imageSize: CGSize(width: 18, height: 18), paddingSize: CGSize(width: 40, height: 40) )
        
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
    

}

