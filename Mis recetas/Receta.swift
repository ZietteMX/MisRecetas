//
//  Receta.swift
//  Mis recetas
//
//  Created by MacMiniDev on 12/18/18.
//  Copyright © 2018 Ziette. All rights reserved.
//

import Foundation
import UIKit

class Receta: NSObject {
    //aqui se crea el model de datos de la clase:
    var nombre: String!
    var imagen: UIImage!
    var tiempoCocción: Int!
    var ingredientes: [String]!//Array de strings
    var pasosReceta : [String]!
    
    //var isFavorito : Bool = false
    var rating : String = "rating"
    
    init(name: String, imagenReceta : UIImage, tiempo: Int, arrIngredientes : [String], arrPasos: [String]) {
        self.nombre = name
        self.imagen = imagenReceta
        self.tiempoCocción = tiempo
        self.ingredientes = arrIngredientes
        self.pasosReceta = arrPasos
    }
}
