//
//  ToDo.swift
//  DoganKaptan
//
//  Created by dogankaptan on 09/01/2023.
//

import Foundation

class ToDo {
    var nom: String
    var description: String
    var aFaire: Bool
    var date: Date = Date.init()
    
    init(nom: String, description: String) {
        self.nom = nom
        self.description = description
        self.aFaire = false
    }
    
    init(nom:String,description: String, date:Date){
        self.nom = nom
        self.description = description
        self.aFaire = false
        self.date = date
    }
}
