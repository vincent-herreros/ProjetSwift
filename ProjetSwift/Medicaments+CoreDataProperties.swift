//
//  Medicaments+CoreDataProperties.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation
import CoreData


extension Medicaments {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicaments> {
        return NSFetchRequest<Medicaments>(entityName: "Medicaments")
    }

    @NSManaged public var nom: String?
    @NSManaged public var dose: Int64
    @NSManaged public var unite: String?
    @NSManaged public var descript: String?
    @NSManaged public var prescription: NSSet?

}

// MARK: Generated accessors for prescription
extension Medicaments {

    @objc(addPrescriptionObject:)
    @NSManaged public func addToPrescription(_ value: Prescriptions)

    @objc(removePrescriptionObject:)
    @NSManaged public func removeFromPrescription(_ value: Prescriptions)

    @objc(addPrescription:)
    @NSManaged public func addToPrescription(_ values: NSSet)

    @objc(removePrescription:)
    @NSManaged public func removeFromPrescription(_ values: NSSet)

}
