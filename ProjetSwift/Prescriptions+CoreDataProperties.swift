//
//  Prescriptions+CoreDataProperties.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation
import CoreData


extension Prescriptions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prescriptions> {
        return NSFetchRequest<Prescriptions>(entityName: "Prescriptions")
    }

    @NSManaged public var dateDebutPrescription: NSDate?
    @NSManaged public var dateFinPrescription: NSDate?
    @NSManaged public var heurePrecise: NSDate?
    @NSManaged public var heureDebut: NSDate?
    @NSManaged public var heureFin: NSDate?
    @NSManaged public var intervalle: NSDate?
    @NSManaged public var medicament: Medicaments?
    @NSManaged public var evenement: Evenements?

}
