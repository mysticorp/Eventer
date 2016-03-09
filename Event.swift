//
//  Event.swift
//  managed_objects
//
//  Created by Erik Walter on 3/9/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//

import UIKit
import CoreData

@objc(Event)
class Event: NSManagedObject {

    class func allEvents() -> [Event]? {
        var events: [Event]?
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            let moc = appDelegate.managedObjectContext
            moc.performBlockAndWait({ () -> Void in
                let fetchRequest = NSFetchRequest(entityName: "Event")
                let sortByDate = NSSortDescriptor(key: "date", ascending: false)
                fetchRequest.sortDescriptors = [sortByDate]
                if let results = (try? moc.executeFetchRequest(fetchRequest)) as? [Event] {
                    events = results
                }
            })
        }
        return events
    }

}
