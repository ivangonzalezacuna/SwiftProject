//
//  ViewController.swift
//  Greet App - L2
//
//  Created by Iván González Acuña on 03/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    var greet: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func english(_ sender: Any) {
        greet = "Hello "
        writeTextLabel(word: greet)
    }
    
    @IBAction func finnsih(_ sender: Any) {
        greet = "Terve "
        writeTextLabel(word: greet)
    }
    
    @IBAction func german(_ sender: Any) {
        greet = "Hallo "
        writeTextLabel(word: greet)
    }
    
    @IBAction func spanish(_ sender: Any) {
        greet = "Hola "
        writeTextLabel(word: greet)
    }
    
    func writeTextLabel(word: String) {
        
        label.text = greet + textfield.text!
    }
}

