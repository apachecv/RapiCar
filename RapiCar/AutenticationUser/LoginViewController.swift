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
        if let email = usernameText.text , let password = passwordText.text {
            Auth.auth().signIn(withEmail: email , password: password, completion: {(user, error) in print("Intentando Iniciar Sesion")
                if error != nil{
                    
                    
                        
                        let alerta = UIAlertController(title: "Error al iniciar Sesion", message: "Usuario: \(self.usernameText.text!) No esta Registrado", preferredStyle: .alert)
                        let btnCancelar = UIAlertAction(title: "Cancelar", style: .default)
                        let btnCrear = UIAlertAction(title: "Crear",
                                                     style: .default,
                                                     handler: {(UIAlertAction)in
                            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SiginViewController
                            vc.definesPresentationContext = true
                            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                            self.present(vc, animated: true, completion: nil)
                        }
                        )
                        alerta.addAction(btnCancelar)
                        alerta.addAction(btnCrear)
                        self.present(alerta,animated: true,completion: nil)
                    
                  
                }else{
                    print("Inicio de Sesion Exitoso")
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Svc") as! SearchViewController
                    vc.definesPresentationContext = true
                    vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
                    )
            }
            
            
       
}
}
/*func validarContraseña(){
    if password != self.passwordText.text! {
        let alerta = UIAlertController(title: "Error al iniciar Sesion", message: "Contraseña Incorrecta", preferredStyle: .alert)
        let btnOk = UIAlertAction(title: "Ok", style: .default)
        alerta.addAction(btnOk)
    }
}*/
