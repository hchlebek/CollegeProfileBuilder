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
        
        college.append(Colleges(Name: "Berkeley", Location: "Berkeley, CA", Number: 37581, Image: UIImage(named: "berkeley")!))
        college.append(Colleges(Name: "University of Chicago", Location: "Chicago, IL", Number: 14467, Image: UIImage(named: "unichicago")!))
        college.append(Colleges(Name: "Stanford", Location: "Stanford, CA", Number: 16136, Image: UIImage(named: "stanford")!))
       
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Colllege", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeNameTextField = myAlert.textFields![0] as UITextField
            let locationTextField = myAlert.textFields! [1] as UITextField
            self.college.append(Colleges(Name: collegeNameTextField.text!, Location: collegeNameTextField.text!))
            self.myTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = college[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = college[indexPath.row].location
        return myTableViewCell
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            college.removeAtIndex(indexPath.row)
            
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let colleges = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(colleges, atIndex: destinationIndexPath.row)
    }


}

