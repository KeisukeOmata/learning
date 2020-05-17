//
//  ViewController.swift
//  map
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    var locManager: CLLocationManager!
    var addressString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
    }

    @IBAction func goToSearchVC(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.description as! NextViewController
        }
    }
    
    //地図を長押しすると住所が表示される
    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        //タップを始めたら
        if sender.state == .began {
          
        //タップを終えたら
        } else if sender.state == .ended {
            //タップした地点
            let tapPoint = sender.location(in: view)
            //緯度経度に変換
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            let lat = center.latitude
            let log = center.longitude
            
            convert(lat: lat, log: log)
        }
    }
    
    func convert(lat: CLLocationDegrees, log: CLLocationDegrees) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: log)
        
        //クロージャー
        geocoder.reverseGeocodeLocation(location) {
            (placeMark, error) in
            if let placeMark = placeMark {
                if let pm = placeMark.first {
                    if pm.administrativeArea != nil || pm.locality != nil {
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                    } else {
                        self.addressString = pm.name!
                    }
                    self.addressLabel.text = self.addressString
                }
            }
        }
    }

}

