//
//  LoginViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore


class LoginViewController: UIViewController {
    
    //LLamar a los objetos insertados
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginUsser: UIButton!
    
    private let database = Firestore.firestore()
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()}
    
    
    //Editar funciones de los buttons:
    @IBAction func atrasBtnn(_ sender: UIButton) {
        _ = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lvc") as! LoginViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginUsser(_ sender: Any) {
        if  usernameText.text == "" || passwordText.text == "" {
            print("Alerta")
            let alerta = UIAlertController(title: "Error", message: "Por favor llene todos los campos", preferredStyle: .alert)
            let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                      style: .default)
            alerta.addAction(btnAceptar)
            self.present(alerta, animated: true, completion: nil)
        }
        
        if let email = usernameText.text , let password = passwordText.text {
            Auth.auth().signIn(withEmail: email , password: password, completion: {(user, error) in print("Intentando Iniciar Sesion")
                if error != nil{
                    if error?.localizedDescription == "The password is invalid or the user does not have a password."{
                        print("Contraseña incorrecta")
                        let alerta = UIAlertController(title: "Error", message: "Contraseña Incorrecta", preferredStyle: .alert)
                        let btnAceptar = UIAlertAction(title: "Aceptar" ,
                                                  style: .default)
                        alerta.addAction(btnAceptar)
                        self.present(alerta, animated: true, completion: nil)
                    }
                    else if error?.localizedDescription == "The email address is badly formatted."{
                        print("Alerta1")
                        let alerta = UIAlertController(title: "Creacion De Usuario", message: "Error al registrar: Usuario \(self.usernameText.text!) no es de tipo user@gmail.com", preferredStyle: .alert)
                        let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                        alerta.addAction(btnOK)
                        self.present(alerta,animated: true,completion: nil)
                    }
                    else {
                        let alerta = UIAlertController(title: "Error al iniciar Sesion", message: "Usuario: \(self.usernameText.text!) No esta Registrado", preferredStyle: .alert)
                        let btnCancelar = UIAlertAction(title: "Cancelar", style: .default)
                        let btnCrear = UIAlertAction(title: "Crear",
                                                     style: .default,
                                                     handler: {(UIAlertAction)in
                            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SiginViewController
                            self.navigationController?.pushViewController(vc, animated: true)                        }
                        )
                        alerta.addAction(btnCancelar)
                        alerta.addAction(btnCrear)
                        self.present(alerta,animated: true,completion: nil)
                    }
                }else{
                    print("Inicio de Sesion Exitoso")
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "svc") as! SearchViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    //self.navigationController?.show(vc , sender: true)
                    //self.navigationController?.pushViewController(vc, animated: true)
                    let docRef = self.database.collection("Usuarios").document(email)
                    docRef.getDocument{ [ weak self] snapshot , error in
                        guard let data = snapshot?.data(),error == nil else {return}
                        guard let nombre = data["Nombre"]as? String else {return}
                        guard let apellido = data["Apellido"]as? String else{return}
                        guard let telefono = data["Celular"]as? String else {return}
                        guard let fechaNacimiento = data["Fecha de Nacimiento"]as? String else {return}
                        
                        print(nombre)
                        print(apellido)
                        print(telefono)
                        print(fechaNacimiento)
                        usuarioLogueado = Usser(email: email , name: nombre, apellido: apellido, telefono: telefono, fechaNacimiento: fechaNacimiento)
                        
                       
                       }
                            }
                    
        

                    }
)
                               
        }
    }
}
    

                               
                               
                

