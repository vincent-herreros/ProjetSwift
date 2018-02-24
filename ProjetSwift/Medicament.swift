//
//  Medicament.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Medicament{
    let nom:String
    let dose:Int
    let unité:String
    let description:String
    
    init(nom:String,dose:Int,unité:String,description:String) {
        self.nom=nom
        self.dose=dose
        self.unité=unité
        self.description=description
    }
}
