//
//  SiginViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import Firebase
import FirebaseAnalytics
import FirebaseAuth

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
        //buttonrRegister.layer.cornerRadius = 20.0
    }
   
    @IBAction func register(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.textUserEmail.text!, password: textPassword.text!, completion: {(user, error) in print("Intentando crear el usuario")
            if error != nil{
                print("El usuario fue creado exitosamente")
                
                //Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                //Va al lado de usuario \(self.textUserEmail!
                
                let alerta = UIAlertController(title: "Creacion De Usuario", message: "Usuario:) se creo correctamente )", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar" ,
                                          style: .default ,
                                          handler:  {(UIAlertAction) in
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
                    vc.definesPresentationContext = true
                    vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                }
                                          )
                            
                alerta.addAction(btnOK)
                    self.present(alerta,animated: true,completion: nil)
                //let alerta = UIAlertController(title: "Creacion De Usuario", message: "Error al registrar Usuario\(String(describing: error))", preferredStyle: .alert)
                }else {
                let alerta = UIAlertController(title: "Creacion De Usuario", message: "Error al registrar Usuario no es de tipo user@gmai.com", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                alerta.addAction(btnOK)
                self.present(alerta,animated: true,completion: nil)
                
                
                
            }
            
        }
        
        
   /* if let email = textUserId.text , let Password = textPasswordTwo.text{
        Auth.auth().createUser(withEmail: email , password: Password){
            (result, error) in
            //let usuario : [name:String, lastName:String, phone:Int, textDateOfBirth] = [textName, textLastName, textPhone, textDateOfBirth]
            
            if let result = result , error == nil{
                 self.navigationController?.pushViewController(HomeViewController(email:result.user.email!, provider: .basic), animated: true)
                
                    let alertController1 = UIAlertController(title: "Creacion de Usuario", message: "Usuario creado Correctamente", preferredStyle: .alert)
                    alertController1.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController1, animated: true, completion: nil)
                self.performSegue(withIdentifier: "loginView", sender: nil)
                let storyboard1 = UIStoryboard(name: "Main", bundle: nil)

                if let lv = storyboard1.instantiateViewController(withIdentifier: "loginView") as?
                    LoginViewController{
                    self.navigationController?.pushViewController(lv, animated: true)
                }else{
                let alertController = UIAlertController(title: "Error", message: "Usuario o Contraseña Incorrecta", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
       
    }
    
    }
            
        override func viewDidLoad() {
    
            super.viewDidLoad()
    }

}*/
                
)
            }
        }
