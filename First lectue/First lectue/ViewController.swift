//
//  ViewController.swift
//  First lectue
//
//  Created by Iván González Acuña on 27/08/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

internal class ViewController : UIViewController { // the class ViewController inheritance UIViewController
    var text: String = ""  // defines a String Variable with name text
    
    @IBOutlet weak var textField: UITextField! // initialises the UITextfield with the name textField
    
    @IBOutlet weak var labelWord: UILabel!  // initialises the UILabel  with the name labelWord
    
    override internal func viewDidLoad(){ // same as onCreate in android
        langInfo()
    }
    
    @IBAction func button(_ sender: Any) { // defines the action from the button
        print("Pressed")                    // prints to console
        text = textField.text!              // gets the text out of the textfield 
        labelWord.text = "Hello " + text     // set the text on the label
    }
    
    
    internal func langInfo(){               
        print("Hello World")
        print(text)
    }
}

