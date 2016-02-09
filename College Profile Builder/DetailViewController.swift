//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by HChlebek on 1/30/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college: Colleges!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameTextfield.text = college.name
        locationTextfield.text = college.location
        numberTextfield.text = String(college.numberOfStudents)
        myImageView.image = college.image
        websiteTextField.text = college.webpage
    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextfield.text!
        college.location = locationTextfield.text!
        college.numberOfStudents = Int(numberTextfield.text!)!
        college.webpage = websiteTextField.text!
    }
    
    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        let myURL = NSURL(string: "https://\(college.webpage)")
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
