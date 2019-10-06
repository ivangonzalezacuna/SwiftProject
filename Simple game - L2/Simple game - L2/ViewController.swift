//
//  ViewController.swift
//  Simple game - L2
//
//  Created by Iván González Acuña on 03/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var points: UILabel! // Define our Label
    var point: Int = 0 // Variable to count our points
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any) { // Called every time we click out Button
        print("Pressed")
        point += 1
        points.text = "You have made " + String(point) + " points" // Show a text in the Label with the updated points
    }
    
}

