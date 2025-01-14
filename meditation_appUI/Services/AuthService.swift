//
//  AuthService.swift
//  meditation_appUI
//
//  Created by Lê Anh Chiêu on 14/1/25.
//

import FirebaseAuth
import FirebaseCore
import Foundation
import GoogleSignIn

class AuthService {
    typealias SignInCompletetion = (AuthDataResult?, Error?) -> Void
    typealias GoogleSignInCompletion = (GIDSignInResult?, Error?) -> Void

    private init() {}

    static let shared = AuthService()

    func signupWithEmail(email: String, password: String, completion: SignInCompletetion?) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }

    func configGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }

    func signUpWithGoogle(withPresenting presenting: UIViewController, completion: SignInCompletetion?) {
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting) { result, error in
            if let error {
                completion?(nil, error)
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                completion?(nil, error)
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential, completion: completion)
        }
    }

    func signUpWithFacebook() {}
}
