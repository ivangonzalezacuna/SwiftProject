//
//  ViewController.swift
//  Notepad - L6
//
//  Created by Iván González Acuña on 01/10/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let note = UserDefaults.standard.string(forKey: "note") // take the text from the text which was in the scree before closing
        textField.text = note // put it to the textfield
    }
    
    
    @IBAction func updateUserDefault(_ sender: Any) { // evertime the text changes it updates the userdefault value for key:note
    UserDefaults.standard.set(textField.text!, forKey: "note")
    }
}

