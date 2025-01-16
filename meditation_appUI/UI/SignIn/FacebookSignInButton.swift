//
//  FacebookSignInButton.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 15/1/25.
//

import UIKit

class FacebookSignInButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        var configuration: Configuration = .filled()
        configuration.cornerStyle = .capsule
        configuration.title = "CONTINUE WITH FACEBOOK"
        configuration.buttonSize = .large
        tintColor = .facebookButton
        self.configuration = configuration
        self.configuration?.baseBackgroundColor = .facebookButton

        let imageView = UIImageView(image: .facebookIcon)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        let height = frame.height

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: height / 4)
        ])
    }
}
