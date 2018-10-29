//
//  ViewController.swift
//  Maps
//
//  Created by fauzanfaurezs on 22/10/2018.
//  Copyright © 2018 fauzanfaurezs. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mkView: MKMapView!
    var gps = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gps.delegate = self
        //minta lokasi gps
        gps.requestLocation()
        gps.requestAlwaysAuthorization()
        // menentukan koordinat awal ketika aplikasi di run
        let coordinate = CLLocationCoordinate2D(latitude: -6.5252653, longitude: 107.035952)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mkView.region = MKCoordinateRegion(center:  coordinate, span: span)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "lokasih lu"
        mkView.addAnnotation(pin)
        // [setting mapkit]
        mkView.isZoomEnabled = true
        mkView.mapType = MKMapType.hybrid
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
            let lokasiku = locations.last?.coordinate
            //add pin in map
            let pin = MKPointAnnotation()
        
            //title pin
            pin.title = "lokasih lu"
        
        // title pin
        pin.coordinate = lokasiku!
        
            mkView.addAnnotation(pin)
        mkView.centerCoordinate = lokasiku!
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}
















