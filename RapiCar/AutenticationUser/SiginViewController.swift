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
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textDateOfBirth: UITextField!
    @IBOutlet weak var buttonrRegister: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
   
    private let database = Firestore.firestore()
    
    
    @IBAction func atrasBtnn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func register(_ sender: Any) {
        if textName.text == "" || textLastName.text == "" || textUserEmail.text == "" || textPassword.text == "" || textPhone.text == "" || textDateOfBirth.text == "" {
            print("Alerta")
            let alerta = UIAlertController(title: "Error", message: "Por favor llene todos los campos", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default)
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true, completion: nil)
        }
        if let email = textUserEmail.text , let password = textPassword.text{
            Auth.auth().createUser(withEmail: email, password: password, completion: { [self](user, error) in print("Intentando crear el usuario")
            if error != nil{
                if error?.localizedDescription == "The email address is badly formatted."{
                    print("Alerta1")
                    let alerta = UIAlertController(title: "Error", message: " Usuario \(self.textUserEmail.text!) no es de tipo user@gmail.com", preferredStyle: .alert)
                    let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                    alerta.addAction(btnOK)
                    self.present(alerta,animated: true,completion: nil)
                }
                else if error?.localizedDescription == "The password must be 6 characters long or more."{
                    print("Alerta2")
                    let alerta = UIAlertController(title: "Error Password", message: "La contraseña debe tener al menos 6 caracteres", preferredStyle: .alert)
                    let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                    alerta.addAction(btnOK)
                    self.present(alerta,animated: true,completion: nil)
                }
                else if textPhone.text?.count != 9 {
                    let alerta = UIAlertController(title: "Error", message: "Verificar Celular", preferredStyle: .alert)
                    let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                              style: .default)
                    alerta.addAction(btnAceptar)
                    self.present(alerta, animated: true, completion: nil)
                }
                else if textDateOfBirth.text?.count != 8 {
                    let alerta = UIAlertController(title: "Error", message: "Verificar Fecha Nacimiento", preferredStyle: .alert)
                    let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                              style: .default)
                    alerta.addAction(btnAceptar)
                    self.present(alerta, animated: true, completion: nil)
                }
                }
                else {
            
                    self.database.collection("Usuarios").document(email).setData([
                        "Nombre":textName.text ?? "",
                        "Apellido":textLastName.text ?? "",
                        "Celular": textPhone.text ?? " " ,
                        "Email": textUserEmail.text ?? "",
                        "Fecha de Nacimiento": textDateOfBirth.text ?? " "])
                    
                    let alerta = UIAlertController(title: "Creacion De Usuario", message: "Usuario se creo correctamente ", preferredStyle: .alert)
                    let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                              style: .default,
                                              handler: {(UIAlertAction)in
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lvc") as! LoginViewController
                        self.navigationController?.pushViewController(vc, animated: true)
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
                            
 

