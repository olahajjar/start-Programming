//
//  DisplayNoteViewController.swift
//  start Programming
//
//  Created by make on 8/19/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//
import FirebaseDatabase
import Foundation
import UIKit
class DisplayNoteViewController: UITableViewController {
    var lessons:[String]=[]
    var content : [String] = []
    var pathUrl : String?
        override func viewDidLoad() {
        super.viewDidLoad()
       let ref = Database.database().reference(withPath:pathUrl!)
       ref.observeSingleEvent(of: .value, with: { (snapshot) in
          let snapshotVal = snapshot.value as! [[String: Any]]
    
        for snap in snapshotVal {
                self.lessons.append(snap[Constants.Database.lessonName] as! String)
            self.content.append(snap[Constants.Database.lessonCntant] as! String)
            }
        
        self.tableView.reloadData()
        })
    }
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
   
    
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
        
            // 2
            else if identifier == "lessonDisplay" {
//                let nav1 = segue.destination as! UINavigationController
                let dest1 = segue.destination as! lessonContant
                let selectedIndex = tableView.indexPathForSelectedRow?.row
                dest1.content = self.content[selectedIndex!]
                // 3
                print("Transitioning to the Display Note View Controller")
            }
        }
    }
}

