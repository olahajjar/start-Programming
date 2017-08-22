//
//  lessonContant.swift
//  start Programming
//
//  Created by make on 8/22/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit
class lessonContant:UIViewController {
    var content : String?

    @IBOutlet weak var lessonControl: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
    }
    
   override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) // 1 noteTitleTextField.text = "" noteContentTextView.text = "" }
    lessonControl.text = content

}
}
