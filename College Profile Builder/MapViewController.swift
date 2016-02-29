//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by HChlebek on 2/18/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{

    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myTextField: UITextField!
    
    var college: Colleges!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        myTextField.text = college.name
        geocodeLocation(myTextField.text!)
    }
    
    @IBAction func searchButtonTapped(sender: UIButton)
    {
        geocodeLocation(myTextField.text!)
        
        myTextField.resignFirstResponder()
    }


func displayMap(MyPlacemark: CLPlacemark)
{
    let myLocation = MyPlacemark
    let mySpan = MKCoordinateSpanMake(1.0, 1.0)
    let myRegion = MKCoordinateRegionMake((myLocation.location?.coordinate)!, mySpan)
    
    myMapView.setRegion(myRegion, animated: true)
    
    let myPin = MKPointAnnotation()
    myPin.coordinate = (myLocation.location?.coordinate)!
    myPin.title = MyPlacemark.name
    
    myMapView.addAnnotation(myPin)
    myTextField.text = MyPlacemark.name
}

func geocodeLocation(mySearch: String)
{
    
    let myGeocode = CLGeocoder()
    
    myGeocode.geocodeAddressString(mySearch) { (placemarks, error) -> Void in
        if error != nil
        {
            print("error")
        }
        else if placemarks!.count > 1
        {
            let mySheet = UIAlertController(title: "Choose Location", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            for each in placemarks!
            {
                mySheet.addAction(UIAlertAction(title: each.name, style: .Default, handler: { (locationsAction) -> Void in
                    self.displayMap(each)
                }))
            }
            self.presentViewController(mySheet, animated: true, completion: nil)
        }
        else
        {
            self.displayMap((placemarks?.first)!)
        }
    }
}
    
    

}
