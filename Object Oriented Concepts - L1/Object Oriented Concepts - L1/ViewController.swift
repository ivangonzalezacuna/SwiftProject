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
        let h1 = house()
        let h2 = house()
        let h3 = house()
        h1.getWindow()
        let g1 : ballSport = ballSport()
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

class ballSport : sport {
    var name = "Tennis"
}

protocol ourInterface {
    var name : String {get set}
    var lastName : String {get set}
    
    static func someTypeMethod()
}

class fromOurInterface : ourInterface {
    var name: String = ""
    
    var lastName: String = ""
    
    static func someTypeMethod() {
        print("Hello")
    }
    
    
}


