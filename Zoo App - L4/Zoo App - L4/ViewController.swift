//
//  ViewController.swift
//  Zoo App - L4
//
//  Created by Iván González Acuña on 17/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Declaration of our Outlets from the View

    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    var audioPlayer: AVAudioPlayer? // Creates an AudioPlayer object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(tapDetected1))
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(tapDetected2))
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(tapDetected3))
        let singleTap4 = UITapGestureRecognizer(target: self, action: #selector(tapDetected4))
        singleTap1.numberOfTapsRequired = 1
        singleTap2.numberOfTapsRequired = 1
        singleTap3.numberOfTapsRequired = 1
        singleTap4.numberOfTapsRequired = 1
        img1.isUserInteractionEnabled = true
        img1.addGestureRecognizer(singleTap1)
        img2.isUserInteractionEnabled = true
        img2.addGestureRecognizer(singleTap2)
        img3.isUserInteractionEnabled = true
        img3.addGestureRecognizer(singleTap3)
        img4.isUserInteractionEnabled = true
        img4.addGestureRecognizer(singleTap4)
        
        // Defines that the ImageViews can recognize if we tap on them
        
        loadMammals() // By default, we load the mammals
    }
    
    // In case one of the ImageView detects a tap on it. Them one of this functions start to run. Where we play the
    // audio which corresponds to a Mammal or a Bird
    
    @objc func tapDetected1(sender: UITapGestureRecognizer) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            do {
            let fileURL = Bundle.main.path(forResource: "bear", ofType: "wav") // Search the audio file path
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!)) // To take the audio file we want to play
            } catch let error {
                print(error)
            }
            audioPlayer?.play() // In case there are no errors, we play it
        case 1:
            do {
                let fileURL = Bundle.main.path(forResource: "huuhkaja_norther_eagle_owl", ofType: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        default: break
        }
    }
    @objc func tapDetected2(sender: UITapGestureRecognizer) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            do {
                let fileURL = Bundle.main.path(forResource: "elephant", ofType: "wav")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        case 1:
            do {
                let fileURL = Bundle.main.path(forResource: "peippo_chaffinch", ofType: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        default: break
        }
    }
    @objc func tapDetected3(sender: UITapGestureRecognizer) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            do {
                let fileURL = Bundle.main.path(forResource: "lamb", ofType: "wav")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        case 1:
            do {
                let fileURL = Bundle.main.path(forResource: "peukaloinen_wren", ofType: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        default: break
        }
    }
    @objc func tapDetected4(sender: UITapGestureRecognizer) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            do {
                let fileURL = Bundle.main.path(forResource: "wolf", ofType: "wav")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        case 1:
            do {
                let fileURL = Bundle.main.path(forResource: "punatulkku_northern_bullfinch", ofType: "mp3")
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL!))
            } catch let error {
                print(error)
            }
            audioPlayer?.play()
        default: break
        }
    }
    
    func loadMammals() { // We load the Mammals by their file name
        self.img1.image = UIImage(named: "bear.jpg")
        self.img2.image = UIImage(named: "elephant.jpg")
        self.img3.image = UIImage(named: "lamb.jpg")
        self.img4.image = UIImage(named: "wolf.jpg")
    }
    
    func loadBirds() { // We load the Mammals by their file name
        self.img1.image = UIImage(named: "huuhkaja.jpg")
        self.img2.image = UIImage(named: "peippo.jpg")
        self.img3.image = UIImage(named: "peukaloinen.jpg")
        self.img4.image = UIImage(named: "punatulkku.jpg")
    }
    
    @IBAction func indexChanged(_ sender: Any) { // If the segmentedController changes, then we have to load the corresponding animals
        switch segmentedController.selectedSegmentIndex {
        case 0:
            print("Selected mammals")
            loadMammals()
        case 1:
            print("Selected birds")
            loadBirds()
        default: break
        }
    }
}

