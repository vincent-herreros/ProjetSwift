//
//  Questionnaire.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Questionnaire: Evenement {
    let dateQuestionnaire:Date
    var reponse: String?
    
    init(rappelEvenement: Rappel,dateQuestionnaire:Date) {
        self.dateQuestionnaire=dateQuestionnaire
        super.init(rappelEvenement: rappelEvenement)
    }
}

