//
//  Evenements+CoreDataProperties.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation
import CoreData


extension Evenements {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Evenements> {
        return NSFetchRequest<Evenements>(entityName: "Evenements")
    }

    @NSManaged public var rappel: NSSet?
    @NSManaged public var prescription: Prescriptions?

}

// MARK: Generated accessors for rappel
extension Evenements {

    @objc(addRappelObject:)
    @NSManaged public func addToRappel(_ value: Rappels)

    @objc(removeRappelObject:)
    @NSManaged public func removeFromRappel(_ value: Rappels)

    @objc(addRappel:)
    @NSManaged public func addToRappel(_ values: NSSet)

    @objc(removeRappel:)
    @NSManaged public func removeFromRappel(_ values: NSSet)

}
