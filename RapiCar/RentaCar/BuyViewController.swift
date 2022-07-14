//
//  BuyViewController.swift
//  RapiCar
//
//  Created by Nttdata on 11/07/22.
//

import UIKit

class BuyViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var puertasLabel: UILabel!
    @IBOutlet weak var añoLabel: UILabel!
    @IBOutlet weak var caballosLabel: UILabel!
    @IBOutlet weak var pasajerosLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var mensajeLabel: UILabel!
    @IBOutlet weak var compraButton: UIButton!
    
    var carroData : ModelCar?
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Llego : \(String(describing: carroData))")
        marcaLabel.text = carroData?.make
        añoLabel.text = carroData?.year
        modeloLabel.text = carroData?.model
        puertasLabel.text = carroData?.puertas
        caballosLabel.text = carroData?.horsepower
        pasajerosLabel.text = carroData?.pasajeros
        precioLabel.text = "S/" + carroData!.price 
        image.loadFrom(URLAddres: carroData?.img_url ?? "")
        mensajeLabel.text = " "
        if carroData!.disponible == false {
            
            compraButton.isHidden = true
            mensajeLabel.text = "Lo sentimos, el vehiculo no esta disponible"
            print("valor:")
            print(carroData!.disponible)
        }
        }
    @IBAction func atrasBtnn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func usserInfo(_ sender: Any) {
    }
    
    }
    
    
    

extension UIImageView {
    func loadFrom(URLAddres: String){
        guard let url = URL(string: URLAddres) else{return}
        DispatchQueue.main.async {
            [weak self] in
            if let imageData = try? Data(contentsOf: url){
                if let loadedImage = UIImage(data: imageData){
                    self?.image = loadedImage
                }
            }
        }
    }
}
