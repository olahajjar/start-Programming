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
                    Constants.progamminLanguge.names.append(snap.value[Constants.Database.languageKey] as! String)
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
                // 3
                print("Transitioning to the Display Note View Controller")
            
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
