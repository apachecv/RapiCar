//
//  TarjetViewController.swift
//  RapiCar
//
//  Created by Nttdata on 12/07/22.
//

import UIKit
import FirebaseFirestore

class TarjetViewController: UIViewController {
    @IBOutlet weak var numeroTarjeta: UITextField!
    @IBOutlet weak var mesAño: UITextField!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var nombres: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var btnCompra: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private let database = Firestore.firestore()
    @IBAction func Compra(_ sender: Any) {
        self.database.collection("Clientes").document("\(self.nombres.text ?? "" )  \(self.apellidos.text ?? "")").setData([
            "Nombre":nombres.text ?? "",
            "Apellido":apellidos.text ?? "",
            "Tarjeta": numeroTarjeta.text ?? " " ,
            "Mes//Año": mesAño.text ?? " ",
            "Cvv": cvv.text ?? " ",
            "email": email.text ?? " "])
        
        let alerta = UIAlertController(title: "Compra Exitosa", message: "Desea volver al menu? ", preferredStyle: .alert)
        let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                  style: .default,
                                  handler: {(UIAlertAction)in
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Svc") as! SearchViewController
            vc.definesPresentationContext = true
            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        )
        alerta.addAction(btnAceptar)
        self.present(alerta, animated: true,completion: nil)
        
        }
}
