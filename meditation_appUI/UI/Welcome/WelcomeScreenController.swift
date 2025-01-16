//
//  WelcomeScreenController.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import Foundation
import UIKit

class WelcomeScreenController: UIViewController {


    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SignUpScreenController") as? SignUpScreenController {
            navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.font = AppTheme.mainFont.withSize(24)
    }
}
