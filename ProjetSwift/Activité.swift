//
//  Activité.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Activité: Evenement {
    var nom :String
    var dateActivité: Date
    var Encouragement:String?
    
    init(rappelEvenement: Rappel,nom:String,dateActivité:Date) {
        self.dateActivité=dateActivité
        self.nom=nom
        super.init(rappelEvenement: rappelEvenement)
        
    }
    
}
