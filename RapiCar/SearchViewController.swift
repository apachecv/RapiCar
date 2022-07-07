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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.register(UINib(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: "car-cell")
        carTableView.rowHeight = 250
        
    }
    
}

extension SearchViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
        return cell!
    }
    
}

