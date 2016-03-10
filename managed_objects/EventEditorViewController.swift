//
//  EventEditorViewController.swift
//  MysticEvents
//
//  Created by Erik Walter on 3/10/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//

import UIKit

class EventEditorViewController: UIViewController {

    var event: Event?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.cancelButton

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let event = event, date = event.date, title = event.title {
            titleTextField.text = title
            datePicker.date = date
        }
    }

    override func viewWillDisappear(animated: Bool) {
        if let event = event {
            do {
                try event.managedObjectContext?.save()
            } catch {
                // throw away changes?
                print("Exception saving changes")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func titleEditDidBegin(sender: AnyObject) {
    }

    @IBAction func titleEditChanged(sender: AnyObject) {
        if let event = event {
            event.title = titleTextField.text
        }
    }
    
    @IBAction func titleEditDidEnd(sender: AnyObject) {
    }
    
    @IBAction func eventDateDidChange(sender: AnyObject) {
        if let event = event {
            event.date = datePicker.date
        }
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        if let event = event {
            event.managedObjectContext?.rollback()
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
