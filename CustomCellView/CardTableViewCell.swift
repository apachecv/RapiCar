//
//  CardTableViewCell.swift
//  RapiCar
//
//  Created by Nttdata on 8/07/22.
//
import UIKit


protocol PressButtonDelegate : AnyObject {
     
    func goBuyView (idCar: Int)
    
}
class CardTableViewCell: UITableViewCell  {

    @IBOutlet weak var imageCar: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var puertasLabel: UILabel!
    @IBOutlet weak var distanciaLabel: UILabel!
    @IBOutlet weak var pasajerosLabel: UILabel!
    @IBOutlet weak var obtenerButton: UIButton!
    @IBOutlet weak var disponibleLabel: UILabel!
    
    weak var btnDelegate : PressButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func obtenerButton(_ sender: UIButton) {
        print("Se presiono el boton")
        self.btnDelegate?.goBuyView(idCar: self.obtenerButton.tag)
       
    }
}
    
    

