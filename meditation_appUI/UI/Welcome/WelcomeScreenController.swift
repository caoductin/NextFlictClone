//
//  WelcomeScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit

class WelcomeScreenController: UIViewController {
    @IBAction func signIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignInScreenController") as? SignInScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignUpScreenController") as? SignUpScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func fogotpassword(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordScreenController") as? ForgotPasswordScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
