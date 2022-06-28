//
//  ViewController.swift
//  RapiCar
//
//  Created by Nttdata on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func login(_ sender: UIButton) {
        
        //let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        //self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @IBAction func sigin(_ sender: UIButton) {
        print("Acces Register")
    }
    
    @IBAction func pass(_ sender: Any) {
        print("pass")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rapicar"
        
        
        
        // Do any additional setup after loading the view.
    }


}

