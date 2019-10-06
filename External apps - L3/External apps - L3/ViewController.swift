//
//  ViewController.swift
//  External apps - L3
//
//  Created by Iván González Acuña on 16/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var browserTxt: UITextField!

    @IBAction func openBrowserBtn(_ sender: Any) {
        let link = browserTxt.text! // gets the text out of the textfield
        let url = URL(string: link)! // creates a URl 
        UIApplication.shared.open(url, options: [:], completionHandler: nil) // opens the browser 
    }
    
    @IBOutlet weak var emailTxt: UITextField! // weak means
    
    @IBAction func sendEmailBtn(_ sender: Any) {
        let email = browserTxt.text!   // get the email adress
        if let url = URL(string: "mailto:\(email)") { // open the email application 
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func openCameraBtn(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var phoneNumberTxt: UITextField!
    
    @IBAction func createCallBtn(_ sender: Any) {
        let number = browserTxt.text!
        let url: NSURL = URL(string: "tel://\(number)")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) // open the call application
    }
}

