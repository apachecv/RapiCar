//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController{
    //,UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar: UITextField!
    @IBOutlet weak var carTableView: UITableView!
    
    let pasajeros: [String] = ["4", "5"]
    let transmision : String = "manual"
    let puertas : String = "4"
    let costo : String = "150"
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.register(UINib(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "car-cell")
        carTableView.rowHeight = 220
    }
}

extension SearchViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        else {
            return 200
        }
    }*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "car-cell", for: indexPath) as? CarTableViewCell
//        cell?.passengersLabel.text = pasajeros[indexPath.row]
        cell?.passengersLabel.text = pasajeros[1]
        cell?.TransmisionLabel.text = transmision
        cell?.doorsLabel.text = puertas
        cell?.priceLabel.text = costo
        return cell!
    }
    
}

