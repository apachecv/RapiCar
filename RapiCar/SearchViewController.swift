//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit

class SearchViewController: UIViewController{
    //,UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource
    
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar: UITextField!
    @IBOutlet weak var carTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
    /*var carArray = [
    "Toyota",
    "Hiunday",
    "Mitsubishi",
    "Chevrolet"
    ]
    
    var backupCarArray: [String] = []
    
    
        backupCarArray = carArray
     
     ####################################################
     extension ViewController:UITableViewDataSource{
         
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             guard let backupCarArray = beerList else { return 0 }
             
             return beers.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
             let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
             
             let beer = beerList![indexPath.row]
             cell.textLabel?.text = beer.name
             
             return cell
             
         }
     #############################################
        
        carTableView.dataSource = self
        carTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        textSearchCar.addTarget(self, action: #selector(textFieldDidChange(_:)),for: .editingChanged)
    }
    

    
    

extension SearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = carArray[indexPath.row]
    
        return cell
    }
}*/
