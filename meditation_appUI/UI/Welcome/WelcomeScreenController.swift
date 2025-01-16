//
//  WelcomeScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit

class WelcomeScreenController: UIViewController {
    @IBOutlet var WelcomeLabel: UILabel!
    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignUpScreenController") as? SignUpScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func loginDidTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignInScreenController") as? SignInScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.font = AppTheme.mainFont.withSize(24)
    }
}
