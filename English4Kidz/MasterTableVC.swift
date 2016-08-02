//
//  MasterTableVC.swift
//  English4Kidz
//
//  Created by HoangHai on 7/29/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    var dictList = ["Flores": "flowers.jpg", "Animales": "animals.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        var arrayKey = Array(dictList.keys)
        
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail")
        {
            let detailVC = segue.destinationViewController as! DetailView
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow!
            let selectedCell: UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)!
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }

}
