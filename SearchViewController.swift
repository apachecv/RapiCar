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

class SearchViewController: UIViewController  {
    
    @IBOutlet weak var titleSearchCar: UILabel!
    @IBOutlet weak var carTableView  : UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    var auto : [ModelCar] = []
    var autoSeleccionado : ModelCar?
    var autoFiltrado : [ModelCar] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        carTableView.rowHeight = 210
        carTableView.register(UINib(nibName: "CardTableViewCell", bundle: nil),    forCellReuseIdentifier: "cellcar")
        carTableView.delegate = self
        carTableView.dataSource = self
        getCarData()
        searchBar.delegate = self

    }
    @IBAction func usserInfo(_ sender: UIButton) {
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
                self.auto = carData
                
                
                DispatchQueue.main.async {
                    self.autoFiltrado = self.auto
                    self.carTableView.reloadData()
                }
                print("---->> hola data:: \(carData)")
                
            }catch{
                print("---->> ha ocurrido un error:: \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        autoFiltrado = []
        if searchText == "" {
            autoFiltrado = auto
        } else {
            for car in auto {
                if car.make.lowercased().contains(searchText.lowercased()){
                    autoFiltrado.append(car)
                }
            }
        }
        self.carTableView.reloadData()
    }
}



extension SearchViewController: UITableViewDataSource , UITableViewDelegate  {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return autoFiltrado.count
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = carTableView.dequeueReusableCell(withIdentifier: "cellcar" , for: indexPath) as! CardTableViewCell
        celda.marcaLabel.text = autoFiltrado[indexPath.row].make
        celda.modeloLabel.text =  autoFiltrado[indexPath.row].model
        celda.precioLabel.text =  "S/" + autoFiltrado[indexPath.row].price
        celda.puertasLabel.text  =  autoFiltrado[indexPath.row].puertas
        celda.pasajerosLabel.text = autoFiltrado[indexPath.row].pasajeros
        if autoFiltrado[indexPath.row].disponible == true {
            celda.disponibleLabel.text = "✅ Disponible"
        }else{
            celda.disponibleLabel.text = "❌ No Disponible"
        }
        
        
        if let url = URL(string: autoFiltrado[indexPath.row].img_url) {
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
        autoSeleccionado = autoFiltrado[indexPath.row]
        
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
            //LocationManager.shared.getLocation()
            print("GPS Activado")
            
            
        }else{

            print("GPS Desactivado")
            
    }
}
}
