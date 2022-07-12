//
//  SiginViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore

class SiginViewController: UIViewController {
    
    
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textUserEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textRepeatPassword: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textDateOfBirth: UITextField!
    @IBOutlet weak var buttonrRegister: UIButton!
    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
   
    private let database = Firestore.firestore()
    @IBAction func register(_ sender: Any) {
        
        if let email = textUserEmail.text , let password = textPassword.text{
            Auth.auth().createUser(withEmail: email, password: password, completion: { [self](user, error) in print("Intentando crear el usuario")
            if error != nil{
                let alerta = UIAlertController(title: "Creacion De Usuario", message: "Error al registrar: Usuario \(self.textUserEmail.text!) no es de tipo user@gmail.com", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                alerta.addAction(btnOK)
                self.present(alerta,animated: true,completion: nil)
                }
                
                else {
                    
                    self.database.collection("Usuarios").document(self.textUserEmail.text ?? "").setData([
                        "Nombre":textName.text ?? "",
                        "Apellido":textLastName.text ?? "",
                        "Celular": textPhone.text ?? " " ,
                        "Fecha de Nacimiento": textDateOfBirth.text ?? " "])
                    
                    let alerta = UIAlertController(title: "Creacion De Usuario", message: "Usuario se creo correctamente ", preferredStyle: .alert)
                    let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                              style: .default,
                                              handler: {(UIAlertAction)in
                        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
                        vc.definesPresentationContext = true
                        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }
                    )
                    alerta.addAction(btnAceptar)
                    self.present(alerta, animated: true,completion: nil)
                    
                    }
        }
)
            }
        }
    
}
