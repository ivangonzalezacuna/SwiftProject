//
//  ViewController.swift
//  Data Transfer - L4
//
//  Created by Iván González Acuña on 17/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField! // Definition of our TextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1Clicked(_ sender: Any) {
        let text = textField.text! // Taking the text from the TextField when we click the Button
        print(text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Function to transfer data from one class to other
        if segue.destination is ViewController2 {
            let vc = segue.destination as? ViewController2 // Defines the var 'vc' for the class ViewController2
            vc?.textFromView = "Greetings " + textField.text! + "!" // We update the var 'textFromView', which is from the other class
        }
    }
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var img: UIImageView! // Define out ImageView
    var textFromView:String = ""
    
    @IBOutlet weak var labelText: UILabel! // Define our Label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let veikko = "Veikko"
        // Do any additional setup after loading the view.
        labelText?.text = textFromView // Set the text we are going to show in the Label
        if (textFromView.isEqual("Greetings " + veikko + "!")) { // Check if the text received is equals to "Veikko"
            print("Hey")
            self.img.image = UIImage(named: "sun.jpg") // If yes, we will show a sun image in our ImageView
        }
    }
}

