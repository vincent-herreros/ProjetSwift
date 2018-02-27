//
//  Evaluation.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 24/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation

class Evaluation : Sequence{
    let heureDebutEvaluation:Date
    let heureFinEvaluation:Date
    fileprivate var eset:[[Questionnaire]]=[]

    var countLig:Int{
        return self.eset.count
    }
    
    init(heureDebutEvaluation:Date,heureFinEvaluation:Date){
        self.heureDebutEvaluation=heureDebutEvaluation
        self.heureFinEvaluation=heureFinEvaluation
    }
    
    func makeIteratorHeure() -> ItEvaluationHeure  {
        return ItEvaluationHeure(self)
    }
    func makeIterator() -> ItEvaluationJour {
        return ItEvaluationJour(self)
    }
    
}

struct ItEvaluationHeure:IteratorProtocol {
    private var current:Int=0
    private let set: Evaluation
    

    mutating func next() -> Questionnaire? {
        return nil
    }
    
    fileprivate init(_ e:Evaluation){
        self.set=e
    }
    
}


struct ItEvaluationJour:IteratorProtocol {
    private let set:Evaluation
    fileprivate init(_ e:Evaluation){
        self.set=e
    }
    mutating func next() -> Questionnaire? {
        return nil
    }

}
