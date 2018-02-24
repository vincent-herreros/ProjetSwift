//
//  Contact.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Contact{
    let nom:String
    let prenom:String
    let categorie:String
    let profession:String
    var tel:String
    
    init(nom:String,prenom:String,categorie:String,profession:String,tel:String) {
        self.nom=nom
        self.prenom=prenom
        self.categorie=categorie
        self.profession=profession
        self.tel=tel
    }
    
}
