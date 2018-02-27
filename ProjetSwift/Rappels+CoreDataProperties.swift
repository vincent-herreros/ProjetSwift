//
//  Rappels+CoreDataProperties.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import Foundation
import CoreData


extension Rappels {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rappels> {
        return NSFetchRequest<Rappels>(entityName: "Rappels")
    }

    @NSManaged public var dateRappel: NSDate?
    @NSManaged public var valide: Bool
    @NSManaged public var evenement: Evenements?

}
