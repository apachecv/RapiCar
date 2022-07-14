//
//  ViewController.swift
//  RapiCar
//
//  Created by Nttdata on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func login(_ sender: UIButton) {
        print("Login")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lvc") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func sigin(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sivc") as! SiginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pass(_ sender: Any) {
        print("pass")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rapicar"

    }


}

