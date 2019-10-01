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
        let note = UserDefaults.standard.string(forKey: "note")
        textField.text = note
    }
    
    
    @IBAction func updateUserDefault(_ sender: Any) {
    UserDefaults.standard.set(textField.text!, forKey: "note")
    }
}

