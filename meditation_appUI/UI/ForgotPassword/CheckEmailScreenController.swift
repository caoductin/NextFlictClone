//
//  CheckEmailScreenControllerViewController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 16/1/25.
//

import UIKit

class CheckEmailScreenController: UIViewController {
    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var headerContentLabel: UILabel!
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

    func setup() {
        headerTitleLabel.font = headerTitleLabel.font.withSize(32)
        headerContentLabel.font = headerContentLabel.font.withSize(16)
    }
}
