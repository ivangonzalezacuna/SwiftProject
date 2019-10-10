//
//  ViewController.swift
//  Weather App - L6
//
//  Created by Iván González Acuña on 01/10/2019.
//  Copyright © 2019 Iván González Acuña. All rights reserved.
//

import UIKit

class ViewController: UIViewController, callbackInterface {
    
    func printData(weatherData: WeatherClass) { // Function to show the data in the ViewController, using the Observer Pattern
        DispatchQueue.main.async {
            self.imageView.image = weatherData.image // We receive an UIImage, it's the way to do it
            weatherData.temp = weatherData.temp - 273.15 // Parse from ºK to ºC
            let tempAux = String(format: "%.1f", weatherData.temp)
            self.tempLabel.text = String(tempAux) + "°C"
            self.forecastLabel.text = weatherData.forecast
        }
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var temp: Float = 0
    var icon: String = ""
    var forecast: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeather(_ sender: Any) {
        let city = textField.text!
        // Creation of the object type WeatherClass
        let weatherObject : WeatherClass = WeatherClass(city: city, cb: self as callbackInterface)
        weatherObject.run() // Run the class, as if it was a thread
    }
}

protocol callbackInterface { // Interface. In Swift it's called 'protocol'
    func printData(weatherData: WeatherClass) -> Void
} 

class WeatherClass :Thread {
    // Variables of the class, used to to print all the info in the ViewController
    var city: String = ""
    var temp: Float = 0
    var icon: String = ""
    var forecast: String = ""
    var image: UIImage? = nil
    
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
    } // Data Struct with all the data we need to take from the JSON file received on the URLSession
    
    var callback : callbackInterface
    
    init(city: String, cb : callbackInterface) {
        self.city = city
        callback = cb
    } // Initialization of the Object
    
    func run() {
    
        if let urlAPI = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=65dbec3aae5e5bf9000c7a956c8b76f6")  {
            URLSession.shared.dataTask(with: urlAPI) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Data.self, from: data) // Decoding the JSON info to variable 'res', using the Data struct
                        self.temp = res.main.temp
                        self.icon = res.weather[0].icon
                        self.forecast = res.weather[0].main
                        // And save the data in the 
    
                        if let urlImage = URL(string: "https://openweathermap.org/img/w/" + self.icon + ".png") {
                            URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, response, error) in
                            // Second URLSession, where we get the Image data, which we have to put into the UIImage object created
                                if error != nil {
                                    print(error!)
                                    return
                                }
                                                                                           
                                self.image = UIImage(data: data!)
                                self.callback.printData(weatherData: self) // Callback. We send the whole Object so that in the main
                                                                           // class we will be able to print all the data properly
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




