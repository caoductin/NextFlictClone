//
//  GoogleSignInButton.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 15/1/25.
//

import UIKit

class GoogleSignInButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    func setup() {
        self.configuration = .plain()
        self.configuration?.title = "CONTINUE WITH GOOGLE"
        self.configuration?.cornerStyle = .capsule
        self.configuration?.buttonSize = .large
        self.configuration?.baseBackgroundColor = .background
        self.configuration?.baseForegroundColor = UIColor(hex: "#3F414E")

        let height = frame.height

        self.layer.borderWidth = 1
        self.layer.cornerRadius = height / 2
        self.layer.borderColor = UIColor.systemGray5.cgColor

        let imageView = UIImageView(image: .googleIcon)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: height / 4)
        ])
    }
}
