//
//  Synthese.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Synthese{
    let évaluation: Evaluation
    let dateSynthese: Date
    var compteRendu: String?
    
    init(évaluation:Evaluation, dateSynthese:Date){
        self.évaluation=évaluation
        self.dateSynthese=dateSynthese
    }
}
