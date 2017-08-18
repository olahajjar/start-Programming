//
//  ListNotesTableViewController.swift
//  start Programming
//
//  Created by make on 8/18/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import Foundation
import UIKit
class ListNotesTableViewController: UITableViewController {
    override func viewDidLoad() {
    super.viewDidLoad()
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
        return 10
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // 2
        cell.programmingLanguge.text = "hey"
        
        
        return cell
    }
    
}
