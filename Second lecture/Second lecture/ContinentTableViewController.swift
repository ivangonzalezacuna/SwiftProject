//
//  ContinentTableViewController.swift
//  Second lecture
//
//  Created by Iván González Acuña on 03/09/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ContinentTableViewController: UITableViewController {
    // Our data strucuture uses tuples
    
    let continents = [("Africa",Int64(1216130000)),
                      ("Australia",Int64(38304000)),
                      ("Antarctica",Int64(0)),
                      ("North America",Int64(579024000)),
                      ("South America",Int64(422535000)),
                      ("Asia",Int64(4581757408)),
                      ("Europe",Int64(738849000))] // Array with the names of the continents and their population

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell") // To register out TableView
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // Executed when we select a row
        
        let result = indexPath.row // Integer with the number of the row selected
        print(continents[result].1)
        
        let textAlert = "Population of " + continents[result].0 + " is " + String(continents[result].1)
        // String with the name of the continent (Column 0), and its population (Column 1)
        
        let alert = UIAlertController(title: continents[result].0, message: textAlert, preferredStyle: .alert)
        // Creation of an Alert Dialog pop-up with a Title, a Message and a Style
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        // Adding an action to that alert. In that case, a button with and "Ok"
        
        self.present(alert, animated: true)
        // Show the alerrt on the screen
    }
    
    // Return number of sections in the table view here
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1 // Number of columns we want to show
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return continents.count // Number of rows we are going to show
    }
    


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        cell.textLabel?.text = self.continents[indexPath.row].0 // Set the text of each cell

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
