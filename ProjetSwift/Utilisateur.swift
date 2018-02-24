//
//  Utilisateur.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Utilisateur{
    
    let nom :String
    let prenom :String
    let sexe: String
    let dateDeNaissance: Date
    
    init(nom:String,prenom:String,sexe:String,dateDeNaissance:Date) {
        self.nom=nom
        self.prenom=prenom
        self.sexe=sexe
        self.dateDeNaissance=dateDeNaissance
    }
    
    
    
}
