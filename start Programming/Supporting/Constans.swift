//
//  Constans.swift
//  start Programming
//
//  Created by make on 8/17/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//


import Foundation
struct Constants {
    struct Segue {
        static let toCreateUsername = "toCreateUsername"
        
    }
    struct UserDefaults {
        static let currentUser = "currentUser"
        static let uid = "uid"
        static let username = "username"
    }
    struct Database {
        static let languageKey = "langaugeName"
         static let languagelist = "lessonList"
    }
    struct progamminLanguge {
        static var names: [String] = []
        static var lessons: [String] = []
    }
}
