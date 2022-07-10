//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import MapKit
import CoreLocation

struct ModelCar : Codable{
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
    
        var distance : Double {
            let myLength = LocationManager.shared.location!.longitude
            let myLatitude =  LocationManager.shared.location!.latitude
            let selfLocation = CLLocation(latitude: myLatitude, longitude: myLength)
            let location = CLLocation(latitude: latitude, longitude: length)
            let distance = selfLocation.distance(from: location)/1000
            return distance
        }
    }



class SearchViewController: UIViewController{
    var auto : [ModelCar] = []
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar : UITextField!
    @IBOutlet weak var carTableView  : UITableView!
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        
        carTableView.rowHeight = 220
        carTableView.register(UINib(nibName: "CardTableViewCell", bundle: nil),    forCellReuseIdentifier: "cellcar")
        
        carTableView.delegate = self
        carTableView.dataSource = self
        getCarData()
                              
    }

    func getCarData(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard data != nil else {
                print("---->> sin data")
                return
            }
            do{
               let jsonData = try Data(contentsOf: url)
                let carData = try JSONDecoder().decode([ModelCar].self, from: jsonData)
                
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
        let celda = carTableView.dequeueReusableCell(withIdentifier: "cellcar" , for: indexPath) as! CardTableViewCell
        celda.marcaLabel.text = auto[indexPath.row].make
        celda.modeloLabel.text =    "Modelo:    " + auto[indexPath.row].model
        celda.añoLabel.text =       "Año:       " + auto[indexPath.row].year
        celda.precioLabel.text =    "Precio:    " + auto[indexPath.row].price
        celda.puertasLabel.text  =  "N° Puertas:" + auto[indexPath.row].puertas
        
        if let url = URL(string: auto[indexPath.row].img_url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    celda.imageCar.image = UIImage(data: data)/// execute on main threadself.imageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
        
        
        
       /* if let url = "https://www.elcarrocolombiano.com/wp-content/uploads/2021/01/20210124-LOS-10-CARROS-MAS-VENDIDOS-DEL-MUNDO-EN-2020-01.jpg" {
            if let imageUrl = URL(string: url) {
                DispatchQueue.main.async {
                    guard let imageData = try? Data(contentsOf: imageUrl) else {
                        return
                    }
                    let image = UIImage (data: imageData)
                    DispatchQueue.main.async {
                        celda.imageCar.image = image
                    }
                }
                
            }
        }*/
        return celda
        
        }
}









/* let urlString = "https://private-anon-1fc702871f-carsapi1.apiary-mock.com/cars"

if let url = URL(string: urlString){
    if let data = try? Data(contentsOf: url){
        let decodificador = JSONDecoder()
        
        if let datosDecodificados = try? decodificador.decode([ModelCar].self, from: data){
            auto = datosDecodificados
            carTableView.reloadData()
        }
    }
}
*/
