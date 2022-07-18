//
//  MyLocation.swift
//  RapiCar
//
//  Created by Nttdata on 14/07/22.
//

import Foundation
import CoreLocation
class MyLocation : NSObject , CLLocationManagerDelegate {
    
    static let shared = MyLocation()
    
    var location: CLLocationCoordinate2D?
    
    let locationManager = CLLocationManager()

    
    override init(){
        super.init()
        self.locationManager.delegate = self
    }
    
    func getLocation(){
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
        print(self.locationManager.requestWhenInUseAuthorization())
        
        self.locationManager.startUpdatingLocation()
        
        
       
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            location = locations.first?.coordinate

        print("localizacion actual \(String(describing: location))")

        }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("################################")
        print(error.localizedDescription)
        print("################################")

        
        
    }
}
