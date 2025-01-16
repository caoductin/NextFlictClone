//
//  FlatTextField.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 15/1/25.
//

import UIKit

class UIFlatTextField: UITextField {
    @IBInspectable var isPasswordField: Bool = false {
        didSet {
            if isPasswordField {
                isSecureTextEntry = true
            }
            setup()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        layer.cornerRadius = 12
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        leftViewMode = .always
        let rightButton: UIButton = .init()
        rightButton.configuration = .plain()
        rightButton.configuration?.image = UIImage(systemName: isSecureTextEntry ? "eye.slash" : "eye")
        rightButton.tintColor = .systemGray
        rightButton.configuration?.buttonSize = .mini
        rightButton.addTarget(self, action: #selector(onEyeTapped), for: .touchUpInside)
        rightView = rightButton
        if isPasswordField {
            rightViewMode = .always
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    @objc func onEyeTapped() {
        isSecureTextEntry.toggle()
        setup()
    }
}
