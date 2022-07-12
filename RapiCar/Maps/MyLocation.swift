//
//  MyLocation.swift
//  RapiCar
//
//  Created by Nttdata on 10/07/22.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate{

    static let shared = LocationManager()
    var location: CLLocationCoordinate2D?
    let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        self.locationManager.delegate = self
    }
    func getLocation(){
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        print("localizacion actual \(String(describing: location))")

        }
}
