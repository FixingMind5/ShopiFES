//
//  Model.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import Foundation

struct Product : Codable {
    // printf("Hola mundo")
    var name: String
    var precio: Float
    var descripcion: String
    var image: String
}
