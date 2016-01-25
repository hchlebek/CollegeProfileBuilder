//
//  ViewController.swift
//  College Profile Builder
//
//  Created by HChlebek on 1/20/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate

{

    @IBOutlet weak var myTableView: UITableView!
    
    var college: [Colleges] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        college.append(Colleges(Name: "Stanford", Location: <#T##String#>, Number: <#T##Int#>, Image: <#T##UIImage#>))
       
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        <#code#>
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        <#code#>
    }


}

