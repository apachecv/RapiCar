//
//  CardTableViewCell.swift
//  RapiCar
//
//  Created by Nttdata on 8/07/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCar: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var añoLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var puertasLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
