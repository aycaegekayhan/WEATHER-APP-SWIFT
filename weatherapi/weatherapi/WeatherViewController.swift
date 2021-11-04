//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation



class WeatherViewController: UIViewController, UITextFieldDelegate, weatherApiDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var imageViewOfCondition: UIImageView!
    @IBOutlet weak var labelOfTemperature: UILabel!
    @IBOutlet weak var LabelOfCity: UILabel!
    @IBOutlet weak var searchEngine: UITextField!
    
    var WeatherApi = weatherApi()
    let locMng =  CLLocationManager()
    
    
    override func viewDidLoad() {
        locMng.delegate = self
        
        WeatherApi.delegate = self
        
        
        super.viewDidLoad()
        
        locMng.requestLocation()
        
        
        searchEngine.delegate = self // let the text field know how it has been interacted
    }

    @IBAction func searchButton(_ sender: UIButton) { //user will type the city and press the search button
        searchEngine.endEditing(true) // editing is done, keyboard can be dismissed
        print(searchEngine.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // take action when 'return' key pressed.
        print(searchEngine.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        if searchEngine.text == "" {
            textField.placeholder = "Search for a place!"
            return false
        } else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cityName = searchEngine.text
        
        WeatherApi.getWeather(nameOfCity: cityName!)

        searchEngine.text = ""
    }
    
    func isWeatherUpdated(_ WeatherApi: weatherApi,weather: WeatherModel) {
        DispatchQueue.main.async {
            self.labelOfTemperature.text = weather.temperatureTurnString
            self.imageViewOfCondition.image = UIImage(systemName: weather.getWeatherCondition)
            self.LabelOfCity.text = weather.cityName
        }
        
    }
    
    func isErrorOccured(error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            WeatherApi.getWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

