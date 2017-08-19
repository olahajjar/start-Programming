//
//  Logout.swift
//  start Programming
//
//  Created by make on 8/20/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
class Logout: UIViewController {
    var authHandle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad() {
    super.viewDidLoad()
        authHandle = Auth.auth().addStateDidChangeListener() { [unowned self] (auth, user) in
            
            guard user == nil else { return }
            
            let loginViewController = UIStoryboard.initialViewController(for: .login)
            self.view.window?.rootViewController = loginViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    deinit {
        if let authHandle = authHandle {
            Auth.auth().removeStateDidChangeListener(authHandle)
        }

    }
    
        @IBAction func logout(_ sender: Any) {
        
            do {
                try Auth.auth().signOut()
            } catch let error as NSError {
                assertionFailure("Error signing out: \(error.localizedDescription)")
            }
        }
    }
