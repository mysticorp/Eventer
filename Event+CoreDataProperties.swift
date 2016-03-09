//
//  Event+CoreDataProperties.swift
//  managed_objects
//
//  Created by Erik Walter on 3/9/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Event {

    @NSManaged var title: String?
    @NSManaged var date: NSDate?

}
