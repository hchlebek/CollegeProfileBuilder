//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by HChlebek on 1/30/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    var college: Colleges!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameTextfield.text = college.name
        locationTextfield.text = college.location
        numberTextfield.text = String(college.numberOfStudents)
        myImageView.image = college.image
    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextfield.text!
        college.location = locationTextfield.text!
        college.numberOfStudents = Int(numberTextfield.text!)!
    }
    
}
