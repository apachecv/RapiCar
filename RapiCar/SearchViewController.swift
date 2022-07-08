//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import CoreLocation

struct Car: Codable {
    
    var car : [ModelCar]
}

struct ModelCar : Codable{
      let year : String
      let id : Int
      let horsepower : Int
      let make : String
      let model : String
      let price : Int
      let img_url : String
    
    
}

class SearchViewController: UIViewController{
    var auto : [ModelCar] = []
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar: UITextField!
    @IBOutlet weak var carTableView: UITableView!
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.rowHeight = 220
        buscarAuto()
        
    }


func buscarAuto(){
    print("LLamando")
    let urlString = "https://private-anon-1fc702871f-carsapi1.apiary-mock.com/cars"
    if let url = URL(string: urlString){
        if let data = try?Data( contentsOf: url){
            print("LLamando data \(data)")
            let decodificador = JSONDecoder()
            
            if let datosDecodificados = try?
                decodificador.decode([ModelCar].self, from: data){
                print("datosDecodificados : \(datosDecodificados.count)")
                auto = datosDecodificados
                carTableView.reloadData()
            }
        }
    }
}
}

extension SearchViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return auto.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = carTableView.dequeueReusableCell(withIdentifier:"celda" , for: indexPath)
        celda.textLabel?.text = auto[indexPath.row].model
            printContent("")
        return celda
            }
}

