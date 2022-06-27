//
//  LoginViewController.swift
//  RapiCar
//
//  Created by Nttdata on 27/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //LLamar a los objetos insertados
    
    
    @IBOutlet weak var titleLogin: UILabel!
    
    @IBOutlet weak var titleUsser: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var titlePassword: UILabel!
    
    @IBOutlet weak var passwordText: UITextField!
    
    //Editar funciones de los buttons:
    
    
    @IBAction func loginUsser(_ sender: UIButton) {
        print("Acces Granted")
    }
    @IBAction func loginFacebook(_ sender: UIButton) {
        print("Acces by Facebook")
    }
    
    @IBAction func loginGoogle(_ sender: UIButton) {
        print("Acces by Google")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
