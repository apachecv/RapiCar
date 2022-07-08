//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import CoreLocation

struct ModelCar : Codable{
      let year         : Int?
      let id           : Int?
      let horsepower   : Int?
      let make         : String?
      let model        : String?
      let price        : Double?
      let img_url      : String?
    
    
}

class SearchViewController: UIViewController{
    var auto : [ModelCar] = []
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar : UITextField!
    @IBOutlet weak var carTableView  : UITableView!
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        carTableView.delegate = self
        carTableView.dataSource = self
        //carTableView.rowHeight = 220
        getCarData()

        
    }

    func getCarData(){
        let url = URL(string: "https://private-anon-1fc702871f-carsapi1.apiary-mock.com/cars")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("---->> sin data")
                return
            }
            do{
                
                let carData = try JSONDecoder().decode([ModelCar].self, from: data)
                
                DispatchQueue.main.async {
                    self.auto = carData
                    self.carTableView.reloadData()
                }

                print("---->> hola data:: \(carData)")
                
            }catch{
                print("---->> ha ocurrido un error:: \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension SearchViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return auto.count
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = carTableView.dequeueReusableCell(withIdentifier:"celda" , for: indexPath)
        celda.textLabel?.text = auto[indexPath.row].model
        return celda
            }
}

