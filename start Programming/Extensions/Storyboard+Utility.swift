//
//  Storyboard+Utility.swift
//  start Programming
//
//  Created by make on 8/17/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import Foundation
//
//  Storyboard+Utility.swift
//  Makestagram
//
//  Created by make on 8/14/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum MGType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    convenience init(type: MGType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    static func initialViewController(for type: MGType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
}
