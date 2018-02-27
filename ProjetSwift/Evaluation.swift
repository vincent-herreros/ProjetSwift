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
    fileprivate var eset:[jourEval]=[]

    
    init(heureDebutEvaluation:Date,heureFinEvaluation:Date){
        self.heureDebutEvaluation=heureDebutEvaluation
        self.heureFinEvaluation=heureFinEvaluation
    }
    var count:Int{
        return self.eset.count
    }
    
    subscript(index: Int) -> jourEval {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.eset[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.eset[index]=newValue
        }
    }
    
    func makeIterator() -> ItEvaluationJour  {
        return ItEvaluationJour(self)
    }
    
}

struct ItEvaluationJour:IteratorProtocol {
    private var current: Int = 0
    private let set:Evaluation
    
    fileprivate init(_ e:Evaluation){
        self.set=e
    }
    @discardableResult
    mutating func reset() -> ItEvaluationJour{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> jourEval? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextJour = self.set.eset[self.current]
        self.current += 1
        return nextJour
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}




class jourEval:Sequence{
    fileprivate var jeset: [Questionnaire]=[]
    var count:Int{
        return self.jeset.count
    }
    
    subscript(index: Int) -> Questionnaire {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.jeset[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.jeset[index]=newValue
        }
    }
    func makeIterator() -> ItEvaluationHeure  {
        return ItEvaluationHeure(self)
    }
    
}

struct ItEvaluationHeure:IteratorProtocol {
    private var current: Int = 0
    private let set: jourEval
    
    fileprivate init(_ s: jourEval){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItEvaluationHeure{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> Questionnaire? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextQuestionnaire = self.set.jeset[self.current]
        self.current += 1
        return nextQuestionnaire
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}


