//
//  Colleges.swift
//  College Profile Builder
//
//  Created by HChlebek on 1/21/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit
class Colleges: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    var webpage = ""

    init(Name: String, Location: String, Number: Int, Image: UIImage, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = Number
        image = Image
        webpage = Webpage
        
    }
    
    init(Name: String, Location: String, Number: Int)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = Number
    }

}
