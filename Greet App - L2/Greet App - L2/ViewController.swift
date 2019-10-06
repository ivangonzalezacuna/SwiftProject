//
//  ViewController.swift
//  Greet App - L2
//
//  Created by Iván González Acuña on 03/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField! // Variable for out TextField
    
    @IBOutlet weak var label: UILabel! // Variable for out Label
    
    var greet: String = ""
    

    @IBAction func textFieldUpdate(_ sender: UITextField) {
        label.text = greet + textfield.text! // When the text in the TextField changes, then we update the text in the Label
    }
    
    // Depending on the button we click. The 'greet' var updates to the corresponding value, and we call a function to show
    // the new greeting message
    
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
    
    func writeTextLabel(word: String) { // Function to update the Label
        label.text = greet + textfield.text!
    }
}

