//
//  BaseViewController.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 17/1/25.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
    }
    
    private func setupCustomBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc private func handleBackTapped() {
        navigationController?.popViewController(animated: true)
    }
}
