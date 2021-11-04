//
//  weatherApi.swift
//  weatherapi
//
//  Created by Ayça ege Kayhan on 11/3/21.
//

import Foundation

struct weatherApi {
    
    let searchUrl = "https://api.openweathermap.org/data/2.5/weather?appid=0e0e1091f2e9b698ab80fdc239ce2d76&units=metric"
    
    func getWeather(nameOfCity: String) {
        
        let stringUrl = "\(searchUrl)&q=\(nameOfCity)"
        acquireRequest(stringUrl: stringUrl)
    }
    
    func acquireRequest(stringUrl: String) {
        if let url = URL(string: stringUrl) { //creating the URL
        
            
            let urlSession = URLSession(configuration: .default) //creates URL session
            
            let taskOfSession = urlSession.dataTask(with: url, completionHandler: handleTask(data:response:error:))
            
            taskOfSession.resume() // Initializing the task
        }
    
    }
    
    func handleTask(data: Data?, response: URLResponse?, error:Error?) -> Void {
        
        if let secureData = data {
            let stringData = String(data: secureData, encoding: .utf8)
            self.jsonParsing(weatherData: secureData)
        }
        
    }
    
    func jsonParsing(weatherData: Data) {
        
        let jsonDecoder = JSONDecoder()
        do {
           let decodedWeatherData = try jsonDecoder.decode(WeatherDataManager.self, from: weatherData)
        }
        catch {
            print(error)
        }
    }
}
