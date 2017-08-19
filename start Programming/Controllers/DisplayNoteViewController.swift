//
//  DisplayNoteViewController.swift
//  start Programming
//
//  Created by make on 8/19/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import UIKit
class DisplayNoteViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   let lessons:[String]=["lesson1","lesson2","lesson3","lesson4","lesson4","lesson5","lesson6","lesson7","lesson8","lessona9"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    // 2
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "Lesson", for: indexPath) as! Lesson
        
        // 2c
        
        cell.lesson.text = lessons[indexPath.row]
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } 
        }
    }
    
}
