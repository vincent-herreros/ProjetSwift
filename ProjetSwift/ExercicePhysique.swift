//
//  ExercicePhysique.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class ExercicePhysique{
    var nom:String
    var description:String
    var temps: Int?
    var répétitions:Int?
    
    init(nom:String,description:String,temps:Int,répétitions:Int) {
        self.nom=nom
        self.description=description
        self.temps=temps
        self.répétitions=répétitions
    }
    init(nom:String,description:String,temps:Int) {
        self.nom=nom
        self.description=description
        self.temps=temps
    }
    init(nom:String,description:String,répétitions:Int) {
        self.nom=nom
        self.description=description
        self.répétitions=répétitions
    }
    init(nom:String,description:String) {
        self.nom=nom
        self.description=description
    }
}
