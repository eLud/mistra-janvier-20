//
//  Contact+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//
//

import Foundation
import CoreData

extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var mail: String?
    @NSManaged public var isAvailable: Bool
    @NSManaged public var company: Company?

}
