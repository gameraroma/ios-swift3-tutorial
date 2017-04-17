//
//  ItemTableViewController.swift
//  PracticeTableView
//
//  Created by Chakpiwat Pacharajindawat on 174//60 BE.
//  Copyright © 2560 Codium. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var items = [Item]()
    
    func loadSampleItems() {
        items += [Item(name:"item1"), Item(name:"item2"), Item(name:"item3")]
    }
    
    func saveItems() {
        let isSaved = NSKeyedArchiver.archiveRootObject(items, toFile: Item.ArchiveURL.path)
        if !isSaved {
            print("Failed to save items...")
        }
    }
    
    func loadItems() -> [Item]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Item.ArchiveURL.path) as? [Item]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        // load items
        if let savedItems = loadItems() {
            items += savedItems
        } else {
            loadSampleItems()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        
        cell.nameLabel.text = item.name

        return cell
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue) {
        let srcViewCon = sender.source as? ViewController
        let item = srcViewCon?.item
        if (srcViewCon != nil && item?.name != "") {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                items[selectedIndexPath.row] = item!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(item!)
            
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            // save items
            saveItems()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! ViewController
            
            if let selectedCell = sender as? ItemTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC.item = selectedItem
            }
        } else if segue.identifier == "AddItem" {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // save items
            saveItems()
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
