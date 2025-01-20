//
//  ValidationTextField.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 20/1/25.
//

import UIKit

class ValidationTextField: UITextField{
    @IBInspectable var validationTypeIndex: Int = 0 {
        didSet {
            setup()
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    enum ValidationType: Int {
        case email = 0
        case userName = 1
    }
    private var validationType: ValidationType {
          return ValidationType(rawValue: validationTypeIndex) ?? .email
      }
  
    private func setup() {
        layer.cornerRadius = 20
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        leftViewMode = .always
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func updateRightView(isValid: Bool) {
        let rightButton: UIButton = .init()
        rightButton.configuration = .plain()
        let iconName = isValid ? "checkmark" : "xmark.circle" // Dùng checkmark hoặc xmark.circle
        rightButton.configuration?.image = UIImage(systemName: iconName)
        rightButton.tintColor = isValid ? .systemGreen : .systemRed
        rightButton.configuration?.buttonSize = .mini
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightView = rightButton
        rightViewMode = .always
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        let usernameRegex = "^[A-Za-z0-9_]{3,16}$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernamePredicate.evaluate(with: username)
    }
    func onTextChanged(){
        guard let text = text,!text.isEmpty else{
            updateRightView(isValid: false)
            return
        }
        let isValid: Bool
        switch validationType{
        case .email :
            isValid = isValidEmail(text)
        case .userName :
            isValid = isValidUsername(text)
        }
        updateRightView(isValid: isValid)
    }
}
