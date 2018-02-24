//
//  RendezVous.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class RendezVous {
    let contact:Contact
    var dateRendezVous:Date
    
    init(contact:Contact,dateRendezVous:Date){
        self.contact=contact
        self.dateRendezVous=dateRendezVous
    }
}
