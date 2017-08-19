//
//  ListNotesTableViewController.swift
//  start Programming
//
//  Created by make on 8/18/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//


import UIKit
class ListNotesTableViewController: UITableViewController {
    let names:[String]=["java","javaScript","swift","C","C++","Html","Jqury","php","css","angular"]
    override func viewDidLoad() {
    super.viewDidLoad()
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
