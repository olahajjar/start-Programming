//
//  LoginViewController.swift
//  start Programming
//
//  Created by make on 8/15/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
   
}
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // 1
        if let user = Auth.auth().currentUser {
            let rootRef = Database.database().reference()
            let userRef = rootRef.child("users").child(user.uid)
            // 1
            userRef.setValue(["username": "chase"])
            
            // 3
            userRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let user = User(snapshot: snapshot) {
                    print("Welcome back, \(user.username).")
                } else {
                    print("New user!")
                }
            })
        
        }
        // 2

            }
}
