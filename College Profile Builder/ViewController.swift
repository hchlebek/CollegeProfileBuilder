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
        
        college.append(Colleges(Name: "Berkeley", Location: "Berkeley, CA", Number: 37581, Image: UIImage(named: "berkeley")!, Webpage: "berkeley.edu"))
        college.append(Colleges(Name: "University of Chicago", Location: "Chicago, IL", Number: 14467, Image: UIImage(named: "unichicago")!, Webpage: "uchicago.edu"))
        college.append(Colleges(Name: "Stanford", Location: "Stanford, CA", Number: 16136, Image: UIImage(named: "stanford")!, Webpage: "stanford.edu"))
       
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeNameTextfield = myAlert.textFields![0] as UITextField
            let locationTextfield = myAlert.textFields![1] as UITextField
            let numberTextfield = myAlert.textFields![2] as UITextField
            self.college.append(Colleges(Name: collegeNameTextfield.text!, Location: locationTextfield.text!, Number: (numberTextfield.text! as NSString).integerValue))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (collegeNameTextfield) -> Void in
            collegeNameTextfield.placeholder = "Add a college name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextfield) -> Void in
            locationTextfield.placeholder = "Add a college location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (numberTextfield) -> Void in
            numberTextfield.placeholder = "Add the number of students"
        }
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailVC.college = college[selectedRow!]
    }

}

