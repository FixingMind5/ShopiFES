//
//  Model.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import Foundation

struct Product : Identifiable, Codable {
    // printf("Hola mundo")
    var id = UUID()
    var name: String
    var precio: Double
    var descripcion: String
    var image: String
    var number: Int = 1
    
    init(name: String, descripcion: String, precio: Double, image: String = "No image") {
        self.name = name
        self.descripcion = descripcion
        self.precio = precio
        self.image = image
    }
    
    init(name: String, precio: Double, descripcion: String, image: String = "No image") {
        self.name = name
        self.descripcion = descripcion
        self.precio = precio
        self.image = image
    }
    
    init(name: String, precio: Double, descripcion: String, image: String = "No image", number: Int) {
        self.name = name
        self.descripcion = descripcion
        self.precio = precio
        self.image = image
        self.number = number
    }
}
