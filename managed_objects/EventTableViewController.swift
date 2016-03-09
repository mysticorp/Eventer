//
//  EventTableViewController.swift
//  managed_objects
//
//  Created by Erik Walter on 3/9/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//

import UIKit
import CoreData

class EventTableViewController: UITableViewController {

    var events = [Event]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem()

        if let events = Event.allEvents() {
            self.events = events
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    @IBAction func addEventAction(sender: AnyObject) {
        let alert = UIAlertController(title: "New Event", message: "Enter title of event.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Add", style: .Default, handler: { (action: UIAlertAction) -> Void in
            if let fields = alert.textFields {
                if let eventTitle = fields[0].text {
                    if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                        let entity = NSEntityDescription.entityForName("Event", inManagedObjectContext: appDelegate.managedObjectContext)
                        
                        let event = Event(entity: entity!, insertIntoManagedObjectContext: appDelegate.managedObjectContext)
                        event.title = eventTitle
                        event.date = NSDate()
                        self.events.append(event)
                        appDelegate.saveContext()
                        self.tableView.reloadData()
                    }
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alert.addTextFieldWithConfigurationHandler(nil)
        self.presentViewController(alert, animated: true, completion: nil)

        
        
    }
    
    private func stringForValue(value: Int, valueName: String) -> String {
        if value > 0 {
            return "\(value)\(valueName) "
        } else {
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)

        let event = events[indexPath.row]
        cell.detailTextLabel?.text = event.title
        if let date = event.date {
            let cal = NSCalendar.currentCalendar()
            let comp = cal.components([.Day, .Month, .Year], fromDate: date, toDate: NSDate(), options: [])
            let timeElapsedString = "\(stringForValue(comp.year, valueName: "y"))\(stringForValue(comp.month, valueName: "m"))\(stringForValue(comp.day, valueName: "d"))"
            cell.textLabel?.text = timeElapsedString.isEmpty ? "no days" : timeElapsedString
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
