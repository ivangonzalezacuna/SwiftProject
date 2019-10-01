//
//  ViewController.swift
//  Weather App - L6
//
//  Created by Iván González Acuña on 01/10/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var temp: Float = 0
    var icon: String = ""
    var forecast: String = ""
    
    struct Data: Codable { // or Decodable
        struct Weather : Codable {
            let icon: String
            let main: String
        }
        struct Main : Codable {
            let temp: Float
        }
        
        let weather: [Weather]
        let main: Main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeather(_ sender: Any) {
        let city = textField.text!

        if let urlAPI = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=65dbec3aae5e5bf9000c7a956c8b76f6")  {
            URLSession.shared.dataTask(with: urlAPI) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Data.self, from: data)
                        self.temp = res.main.temp
                        self.icon = res.weather[0].icon
                        self.forecast = res.weather[0].main
                        
                        if let urlImage = URL(string: "https://openweathermap.org/img/w/" + self.icon + ".png") {
                            URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, response, error) in
                                
                                if error != nil {
                                    print(error!)
                                    return
                                }
                                
                                DispatchQueue.main.async {
                                    self.imageView.image = UIImage(data: data!)
                                    self.temp = self.temp - 273.15
                                    self.tempLabel.text = String(format: "%.1f", self.temp)
                                    self.forecastLabel.text = self.forecast
                                }
                            }).resume()
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}




