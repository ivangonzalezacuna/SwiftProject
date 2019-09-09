//
//  ViewController.swift
//  First lectue
//
//  Created by Iván González Acuña on 27/08/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

internal class ViewController : UIViewController {
    var text: String = ""
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var labelWord: UILabel!
    
    override internal func viewDidLoad(){
        langInfo()
    }
    
    @IBAction func button(_ sender: Any) {
        print("Pressed")
        text = textField.text!
        labelWord.text = "Hello " + text
    }
    
    
    internal func langInfo(){
        print("Hello World")
        print(text)
    }
}

