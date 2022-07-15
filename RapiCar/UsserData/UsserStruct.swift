//
//  UsserStruct.swift
//  RapiCar
//
//  Created by Nttdata on 14/07/22.
//

import Foundation

struct Usser : Codable {
    var email : String
    var name : String
    var apellido : String
    var telefono : String
    var fechaNacimiento : String
}
var usuarioLogueado : Usser? 


