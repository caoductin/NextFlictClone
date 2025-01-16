//
//  ForgotPasswordScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit

class ForgotPasswordScreenController: UIViewController {
    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var headerContentLabel: UILabel!
    @IBOutlet var emailField: UIFlatTextField!
    @IBAction func submidDidTapped(_ sender: UIButton) {
        // Send email...
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CheckEmailScreenController") as? CheckEmailScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func loginDidTapped(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers {
            for vc in viewControllers {
                if vc is SignInScreenController {
                    navigationController?.popToViewController(vc, animated: true)
                    return
                }
            }
        }
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignInScreenController") as? SignInScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func setup() {
        headerTitleLabel.font = headerTitleLabel.font.withSize(32)
        headerContentLabel.font = headerContentLabel.font.withSize(16)
    }
}
