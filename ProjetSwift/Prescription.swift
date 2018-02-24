//
//  Prescription.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Prescription: Evenement {
    let médicament: Medicament
    var dateDebutPrescription: Date
    var dateFinPrescription:Date
    var heurePrecise: Date?
    var heureDebut: Date?
    var heureFin : Date?
    var intervalle : Int?


    init(rappelEvenement:Rappel,médicament:Medicament,dateDebutPrescription:Date,dateFinPrescription:Date,heurePrecise:Date){
        
        self.médicament=médicament
        self.dateFinPrescription=dateFinPrescription
        self.dateDebutPrescription=dateDebutPrescription
        self.heurePrecise=heurePrecise
        super.init(rappelEvenement : rappelEvenement)
    }
    
    init(rappelEvenement:Rappel,médicament:Medicament,dateDebutPrescription:Date,dateFinPrescription:Date,heureDebut:Date,heureFin:Date,intervalle:Int){
        
        self.médicament=médicament
        self.dateDebutPrescription=dateDebutPrescription
        self.dateFinPrescription=dateFinPrescription
        self.heureDebut=heureDebut
        self.heureFin=heureFin
        self.intervalle=intervalle
        super.init(rappelEvenement : rappelEvenement)
    }
    
    
    
}
