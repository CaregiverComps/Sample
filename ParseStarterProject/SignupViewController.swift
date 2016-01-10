//
//  SignupViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Jonathan Brodie on 1/6/16.
//  Copyright (c) 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class SignupViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBAction func signupbutton(sender: AnyObject) {
        var user=PFUser()
        user.username=username.text
        user.password=password.text
        
        user.signUpInBackgroundWithBlock {
            (success,error) in
            if error == nil {
                // Hooray! Let them use the app now.
                println("New account created:\n"+user.username!+"\n"+user.password!)
            } else {
                // Show the errorString somewhere and let the user try again.
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let testObject = PFObject(className: "TestObject")
        testObject.setObject("bar", forKey: "foo")
        //testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}