//
//  ViewController.swift
//  Object Oriented Concepts - L1
//
//  Created by Iván González Acuña on 27/08/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func ex() {
        let h1 = house() // create the object h1
        let h2 = house()
        let h3 = house()
        h1.getWindow()  // call methode
        let g1 : ballSport = ballSport() // create the object g1
    }
    
}

class house {
    var window = 1
    func getWindow() { 
        print(window)
    }
    func addWindow() {
        window += 1
    }
    func delWindow() {
        window -= 1
    }
}

class sport {
    var points = 0
}

class ballSport : sport { // inheritance/extends sport
    var name = "Tennis" // defines a variable
}

protocol ourInterface { // this is a interface
    var name : String {get set} // abstract variables
    var lastName : String {get set}
    
    static func someTypeMethod() //abstract methodes
}

class fromOurInterface : ourInterface { // implements the interface
    var name: String = ""
    
    var lastName: String = ""
    
    static func someTypeMethod() {
        print("Hello")
    }    
}


