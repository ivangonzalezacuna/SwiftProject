//
//  ViewController.swift
//  Egg Timer - L5
//
//  Created by Iván González Acuña on 24/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    var array: [[String]] = [[String]]()
    var minutesArray: [String] = [String]()
    var secondsArray: [String] = [String]()
    var minutes: [Int] = [Int]()
    var seconds: [Int] = [Int]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...59 {
            secondsArray.append(String(i) + " seconds")
            minutesArray.append(String(i) + " minutes")
            seconds.append(i)
            minutes.append(i)
        }
        array.append(minutesArray)
        array.append(secondsArray)

        self.picker.delegate = self
        self.picker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return array[0].count
        } else {
            return array[1].count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return array[0][row]
        } else {
            return array[1][row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController2 {
            let vc = segue.destination as? ViewController2
            
            vc?.minutes = minutes[picker.selectedRow(inComponent: 0)]
            vc?.seconds = seconds[picker.selectedRow(inComponent: 1)]
        }
    }
}

class ViewController2 : UIViewController {
    
    var minutes: Int = 0
    var seconds: Int = 0
    var timer = Timer()
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text! = ""
        let utterance = AVSpeechUtterance(string: "Timer started")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController2.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        textLabel.text! = String(minutes) + ":" + String(seconds)
        if (minutes == 0 && seconds == 0) {
            let utterance = AVSpeechUtterance(string: "Done")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
            _ = navigationController?.popViewController(animated: true)
        }
        seconds -= 1
        if seconds == -1 {
            minutes -= 1
            seconds = 59
        }
    }
}

