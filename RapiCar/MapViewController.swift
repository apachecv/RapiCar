//
//  MapViewController.swift
//  RapiCar
//
//  Created by Nttdata on 10/07/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: -6.773 , longitude: -79.84)
    

    override func viewDidLoad() {
        view.addSubview(map)
        map.frame = view.bounds
        super.viewDidLoad()
        
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1 )) , animated: false)

        // Do any additional setup after loading the view.
    }
    
    


}
