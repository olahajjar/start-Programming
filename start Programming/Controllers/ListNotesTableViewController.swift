//
//  ListNotesTableViewController.swift
//  start Programming
//
//  Created by make on 8/18/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import FirebaseDatabase
import UIKit
class ListNotesTableViewController: UITableViewController {
    var names:[String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let snapshotVal = snapshot.value as! [String: [String: Any]]
            
            for snap in snapshotVal {
                if snap.key != "users" {
                self.names.append(snap.value[Constants.Database.languageKey] as! String)
                }
            }
            self.tableView.reloadData()
        })
        
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                //let nav = segue.destination as! UINavigationController
                let dest = segue.destination as! DisplayNoteViewController
                // 3
                print("Transitioning to the Display Note View Controller")
                let selectedIndex = tableView.indexPathForSelectedRow?.row
                if names[selectedIndex!] == Constants.Database.javaName{
                    // 4
                    dest.pathUrl = Constants.Database.javaPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.javascriptName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.javascriptPath + Constants.Database.lessonList
                }
                else if names[selectedIndex!] == Constants.Database.swiftName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.swiftPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.HtmlName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.HtmlPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.cssName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.cssPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.angularName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.angularPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.jaquryName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.jaquryPath + Constants.Database.lessonList
                }else if names[selectedIndex!] == Constants.Database.phpName{
                    
                    
//                    let dest = segue.destination as! DisplayNoteViewController
                    // 4
                    dest.pathUrl = Constants.Database.phpPath + Constants.Database.lessonList
                }
            }
            
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // 2
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // 2c
        cell.programmingLanguge.text = names[indexPath.row]
        
        return cell
    }
    
}
