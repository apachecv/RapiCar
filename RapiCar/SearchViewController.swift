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
        carTableView.dataSource = self
        carTableView.register(UINib(nibName: "Car2TableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        
    }
    
    
    

    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? Car2TableViewCell
        return cell!
    }
    
    
/*func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "car-cell", for: indexPath) as? CarTableViewCell
    
    
    return cell!


}*/
}

