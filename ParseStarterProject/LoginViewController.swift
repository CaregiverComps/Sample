//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Jonathan Brodie on 1/6/16.
//  Copyright (c) 2016 Parse. All rights reserved.

import Foundation

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(sender: UIButton) {
        
        PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
            (user, error) in
            if user != nil {
                // Yes, User Exists
                println("Successful login")
            } else {
                // No, User Doesn't Exist
                println("Login unsuccessful")
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
