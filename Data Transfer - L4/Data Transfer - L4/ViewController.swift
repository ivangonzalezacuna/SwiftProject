//
//  ViewController.swift
//  Data Transfer - L4
//
//  Created by Iván González Acuña on 17/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1Clicked(_ sender: Any) {
        let text = textField.text!
        print(text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController2 {
            let vc = segue.destination as? ViewController2
            vc?.textFromView = "Greetings " + textField.text! + "!"
        }
    }
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var textFromView:String = ""
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let veikko = "Veikko"
        // Do any additional setup after loading the view.
        labelText?.text = textFromView
        if (textFromView.isEqual("Greetings " + veikko + "!")) {
            print("Hey")
            self.img.image = UIImage(named: "sun.jpg")
        }
    }
}

