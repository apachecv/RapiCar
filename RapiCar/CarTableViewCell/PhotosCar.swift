//
//  PhotosCar.swift
//  RapiCar
//
//  Created by Nttdata on 7/07/22.
//

import Foundation
class PhotosCar : Codable {
    @objc private var year : String
    @objc private var id : Int
    @objc private var horsepower : Int
    @objc private var make : String
    @objc private var model : String
    @objc private var price : Int
    @objc private var img_url : String
    
    init() {
        self.year = ""
        self.id = 0
        self.horsepower = 0
        self.make = ""
        self.model = ""
        self.price = 0
        self.img_url = ""
    }
    func getyear() -> String{return self.year}
    func getid() -> Int{return self.id}
    func gethorsepower() -> Int{return self.horsepower}
    func getmake() -> String{return self.make}
    func getmodel() -> String{return self.model}
    func getprice() -> Int{return self.price}
    func getimg_url() -> URL? {return URL(string: self.img_url)}
}
