//
//  SearchViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import Foundation
import MapKit
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
    
        var distance : Double {
            let myLength = LocationManager.shared.location!.longitude
            let myLatitude =  LocationManager.shared.location!.latitude
            let selfLocation = CLLocation(latitude: myLatitude, longitude: myLength)
            let location = CLLocation(latitude: latitude, longitude: length)
            let distance = selfLocation.distance(from: location)/1000
            return distance
        }
    }

class SearchViewController: UIViewController  {
    
    
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var textSearchCar : UITextField!
    @IBOutlet weak var carTableView  : UITableView!
    
    var auto : [ModelCar] = []
    var autoSeleccionado : ModelCar?
    
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
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
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
 



extension SearchViewController: UITableViewDataSource , UITableViewDelegate  {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return auto.count
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = carTableView.dequeueReusableCell(withIdentifier: "cellcar" , for: indexPath) as! CardTableViewCell
        celda.marcaLabel.text = auto[indexPath.row].make
        celda.modeloLabel.text =  auto[indexPath.row].model
        celda.añoLabel.text =  "Año:" + auto[indexPath.row].year
        celda.precioLabel.text =  auto[indexPath.row].price
        celda.puertasLabel.text  =  auto[indexPath.row].puertas
        celda.pasajerosLabel.text = auto[indexPath.row].pasajeros
        
        if let url = URL(string: auto[indexPath.row].img_url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    celda.imageCar.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        return celda
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        autoSeleccionado = auto[indexPath.row]
        
        performSegue(withIdentifier: "go", sender: self)
        carTableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go" {
            let vcLlegada = segue.destination as! BuyViewController
            vcLlegada.carroData = autoSeleccionado
        }
        
        
    }
    
    @IBAction func DistanceSwitch(_ sender: UISwitch) {
        if sender.isOn {
            LocationManager.shared.getLocation()
            print("GPS Activado")
            
        }else{

            print("GPS Desactivado")
            
    }
}
}
/*extension SearchViewController : PressButtonDelegate {
    func goBuyView (idCar : Int){
        performSegue(withIdentifier: "go", sender: idCar)
        print("")
    }
    
}*/
