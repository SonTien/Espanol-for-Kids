//
//  DetailView.swift
//  English4Kidz
//
//  Created by HoangHai on 7/29/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit

class DetailView: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        self.createDataWithName(stringTitle)
        self.tableView.registerClass((UITableViewCell.self), forCellReuseIdentifier: "Cell")
    }
    
    func createDataWithName(title: String)
    {
        var path: String = ""
        if (title == "Flores")
        {
            path = NSBundle.mainBundle().pathForResource("FlowerList", ofType: "plist")!
        }
        if (title == "Animales")
        {
            path = NSBundle.mainBundle().pathForResource("AnimalList", ofType: "plist")!
        }

        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        cell.backgroundColor = UIColor.init(red: 236/255, green: 72/255, blue: 45/255, alpha: 1.0)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let moreDetail = storyboard?.instantiateViewControllerWithIdentifier("Insight") as! InsightView
        self.navigationController!.pushViewController(moreDetail, animated: true)
        
        let key: String = arrayKeys[indexPath.row] as! String
        moreDetail.text = key
        moreDetail.detailImage = UIImage(named: "\(dictData[key]!)")
    }

}
