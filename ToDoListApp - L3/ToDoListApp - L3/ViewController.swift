//
//  ViewController.swift
//  ToDoListApp - L3
//
//  Created by Iván González Acuña on 10/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! // init from tabelView
    var todoList = [String]() // array definition
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onClick(_ sender: UIBarButtonItem) {
        showTodoTextQueryDialog()
    }
    
    func showTodoTextQueryDialog() {
        var textInput: UITextField? = nil // variable declaration
        let alert = UIAlertController(title: "Add new", message: "Please enter text for the item", preferredStyle: UIAlertController.Style.alert) // create new allert class (popup window)
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: {_ in
            
            
            
            print("OK Button pressed : " + textInput!.text!)
            
            
            let txt:String = textInput!.text! // puts text from text field in constante txt
            self.todoList.append(txt)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: self.todoList.count-1, section: 0)], with: .automatic)
            self.tableView.endUpdates()
            
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
            
        }))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "ToDo Item"
            textInput = textField
        })
        self.present(alert, animated: true, completion: nil)
    }
    

}
