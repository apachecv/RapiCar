//
//  Structur.swift
//  RapiCar
//
//  Created by Nttdata on 12/07/22.
//

import Foundation
import CoreLocation
struct Auto : Codable  {
    let carro : [ModelCar]
}
struct ModelCar : Codable , Identifiable {
      let horsepower   : String
      let id           : Int
      let img_url      : String
      let make         : String
      let model        : String
      let price        : String
      let year         : String
      let puertas      : String
      let pasajeros    : String
      let latitude     : Double
      let length       : Double
      let disponible   : Bool
    
        var distance : Double {
            let myLength = LocationManager.shared.location!.longitude
            let myLatitude =  LocationManager.shared.location!.latitude
            let selfLocation = CLLocation(latitude: myLatitude, longitude: myLength)
            let location = CLLocation(latitude: latitude, longitude: length)
            let distance = selfLocation.distance(from: location)/1000
            return distance
        }
    }
