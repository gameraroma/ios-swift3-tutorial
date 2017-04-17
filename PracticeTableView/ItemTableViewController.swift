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

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleItems()
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
            let newIndexPath = NSIndexPath(row: items.count, section: 0)
            items.append(item!)
            
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
        }
    }
}
