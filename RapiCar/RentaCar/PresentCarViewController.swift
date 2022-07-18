//
//  TarjetViewController.swift
//  RapiCar
//
//  Created by Nttdata on 12/07/22.
//

import UIKit
import FirebaseFirestore

class TarjetViewController: UIViewController {
 
    @IBOutlet weak var fecha: UITextField!
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var nombres: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var btnCompra: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func usserInfo(_ sender: UIButton) {
    }
    
    @IBAction func atrasBtnn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    private let database = Firestore.firestore()
    @IBAction func Compra(_ sender: Any) {
        
        self.database.collection("Solicitudes de Renta").document("\(self.nombres.text ?? "" )  \(self.apellidos.text ?? "")").setData([
            "Nombre":nombres.text ?? "",
            "Apellido":apellidos.text ?? "",
            "DNI":dni.text ?? "",
            "Fecha":fecha.text ?? "",
            "Email": email.text ?? "",
            "Celular": celular.text ?? "",])
        if nombres.text == "" || apellidos.text == "" || dni.text == "" || fecha.text == "" || email.text == "" || celular.text == "" {
            print("Alerta")
            let alerta = UIAlertController(title: "Error", message: "Por favor llene todos los campos", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default)
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true, completion: nil)
        }
        else if dni.text?.count != 8 {
            let alerta = UIAlertController(title: "Error", message: "Verificar DNI", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default)
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true, completion: nil)
        }
        else if celular.text?.count != 9 {
            let alerta = UIAlertController(title: "Error", message: "Verificar Celular", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default)
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true, completion: nil)
        }
        
        else{
            let alerta = UIAlertController(title: "Solicitud Exitosa", message: "Se le informara por email o a traves de una llamada al aceptar su solicitud", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default,
                                      handler: {(UIAlertAction)in
                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "svc") as! SearchViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            )
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true,completion: nil)
        }
        }
}
