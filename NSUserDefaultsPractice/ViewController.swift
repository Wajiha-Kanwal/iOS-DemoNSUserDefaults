//
//  ViewController.swift
//  NSUserDefaultsPractice
//
//  Created by Wajiha Kanwal on 16/09/2015.
//  Copyright (c) 2015 Wajiha Kanwal. All rights reserved.
//

// Done following this : https://www.codementor.io/ios/tutorial/persistent-data-iphone-app-sessions-nsuserdefaults-improve-user-experience-best-practice

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveButtonClick(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(firstName.text, forKey: "firstName")
        defaults.setObject(lastName.text, forKey: "lastName")
        defaults.synchronize()
        
        println("fn=\(firstName.text), ln=\(lastName.text)")
    }
    
    @IBAction func clearButtonClick(sender: AnyObject) {
        if(firstName.text == ""){
            loadDefaults()
            clearButton.setTitle("Clear", forState: .Normal)
        }
        else {
            firstName.text = ""
            lastName.text = ""
            clearButton.setTitle("Load", forState: .Normal)
        }
    }
    
    func loadDefaults(){
        let defaults = NSUserDefaults.standardUserDefaults()
        firstName.text = defaults.objectForKey("firstName") as String
        lastName.text = defaults.objectForKey("lastName") as String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

