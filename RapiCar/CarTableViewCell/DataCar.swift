//
//  DatosAutos.swift
//  RapiCar
//
//  Created by Nttdata on 7/07/22.
//

import Foundation
import SwiftUI
import Alamofire

class DataCar : Decodable {
    static let shared = DataCar(baseURL: URL(string: "https://private-anon-1fc702871f-carsapi1.apiary-mock.com")!)
    
    // Atributos
    let baseURL : URL
    
    private init(baseURL : URL){
        self.baseURL = baseURL
    }
    
    /**
        GetPhotos
     Obtiene un arreglo de fotos desde el API
     */
    func getPhotos(completion: @escaping([PhotosCar]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/cars"),method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            if let data = response.data{
                do {
                    let fotos = try JSONDecoder().decode([PhotosCar].self, from: data)
                    completion(fotos, nil)
                }catch{
                    completion(nil, "Error al decodificar")
                }
            }else{
                completion(nil, "Error en la conexión")
            }
        }
    }
    
    func getTodos(id : Int, completion: @escaping([Todos]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/todos"),method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            if let data = response.data{
                do {
                    let todos = try JSONDecoder().decode([Todos].self, from: data)
                    completion(todos, nil)
                }catch{
                    completion(nil, "Error al decodificar")
                }
            }else{
                completion(nil, "Error en la conexión")
            }
        }
    }
    
    
}
    
    
    

}
