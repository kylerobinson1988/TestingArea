//
//  AddPersonViewController.swift
//  ProtocolPractice
//
//  Created by Kyle Brooks Robinson on 9/16/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

protocol EditPersonDelegate {
    
    func editPersonDidFinish(person: Person)
    
}

class AddPersonViewController: UIViewController {
    
    var delegate: EditPersonDelegate?

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.view.setNeedsUpdateConstraints()
            self.view.setNeedsLayout()
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size{
                
                self.bottomConstraint.constant = 20 + kbSize.height
                
            }
            
        }
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardDidHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.bottomConstraint.constant = 20
            
            // Do any additional setup after loading the view.
        
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        let name = nameField.text
        let age = ageField.text
        
        let newPerson = Person(name: name, age: age)
        delegate?.editPersonDidFinish(newPerson)
        
        dismissViewControllerAnimated(true, completion: nil)
        
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
