//
//  LogoutViewController.swift
//  RapiCar
//
//  Created by Nttdata on 13/07/22.
//

import UIKit
import FirebaseAuth

class LogoutViewController: UIViewController {
    
    @IBOutlet weak var btnn: UIButton!
 
    @IBOutlet weak var usuarioLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var fechaNacLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuarioLabel.text = "Usuario:              " + usuarioLogueado!.email
        nombreLabel.text =  "Nombre:               " + usuarioLogueado!.name  + " " +  usuarioLogueado!.apellido
        fechaNacLabel.text = "Fecha de Nacimiento: " + usuarioLogueado!.fechaNacimiento
        telefonoLabel.text = "Telefono:            " + usuarioLogueado!.telefono
        
    }

    @IBAction func btnn(_ sender: UIButton) {
        
        try! Auth.auth().signOut()

        if self.storyboard != nil {
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! ViewController
        
            vc.modalPresentationStyle = .fullScreen
            self.showDetailViewController(vc, sender: true)
                }
      
        }
}
    
    


