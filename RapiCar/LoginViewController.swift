//
//  LoginViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth


class LoginViewController: UIViewController {
    
    //LLamar a los objetos insertados

    
    
    @IBOutlet weak var usernameText: UITextField!
    
    
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var loginUsser: UIButton!
    
    
    
    //Editar funciones de los buttons:
    
    
    @IBAction func loginUsser(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.usernameText.text!, password: passwordText.text!, completion: {(user, error) in print("Intentando Iniciar Sesion")
            if error != nil{
                
                let alerta = UIAlertController(title: "Error al iniciar Sesion", message: "Usuario: \(self.usernameText.text!) No esta Registrado", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Cancelar", style: .default)
                let btnCrear = UIAlertAction(title: "Crear",
                                             style: .default,
                                             handler: {(UIAlertAction)in
                    
                    //self.performSegue(withIdentifier: "SiginViewController", sender: nil)
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SiginViewController
                    vc.definesPresentationContext = true
                    vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
                )
                alerta.addAction(btnOK)
                alerta.addAction(btnCrear)
                self.present(alerta,animated: true,completion: nil)
            }else{
                print("Inicio de Sesion Exitoso")
        
                self.performSegue(withIdentifier: "iniciasesionsegue", sender: nil)
        /*if let email = usernameText.text, let password = passwordText.text {
            
            Auth.auth().signIn(withEmail: email, password: password){
                
                (result , error) in
                
                if let result = result , error == nil{
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let svc = storyboard.instantiateViewController(withIdentifier: "svc") as? SearchViewController{
                        self.navigationController?.pushViewController(svc, animated: true)
                    }
                    
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Usuario o Contraseña Incorrecta", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }*/
/*@IBAction func loginFacebook(_ sender: UIButton) {
        print("Acces by Facebook")
    }
    @IBAction func loginGoogle(_ sender: UIButton) {
        print("Acces by Google")
    }*/
            }
        }
                )
        }
}
