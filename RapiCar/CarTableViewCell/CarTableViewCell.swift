//
//  CarTableViewCell.swift
//  RapiCar
//
//  Created by Nttdata on 5/07/22.
//

import UIKit

    


class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var TransmisionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rentButton.layer.cornerRadius = 10
        // Initialization code
    }
    @IBAction func ObtenerButton(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
