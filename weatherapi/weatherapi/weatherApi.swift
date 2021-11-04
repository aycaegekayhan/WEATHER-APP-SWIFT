//
//  weatherApi.swift
//  weatherapi
//
//  Created by Ayça ege Kayhan on 11/3/21.
//

import Foundation

protocol weatherApiDelegate {
    func isWeatherUpdated(_ WeatherApi: weatherApi,weather: WeatherModel)
    func isErrorOccured(error: Error)
}

struct weatherApi {
    
    let searchUrl = "https://api.openweathermap.org/data/2.5/weather?appid=0e0e1091f2e9b698ab80fdc239ce2d76&units=metric"
    
    var delegate: weatherApiDelegate?
    
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
            if let weatherCond = self.jsonParsing(weatherData: secureData) {
                delegate?.isWeatherUpdated(self, weather: weatherCond)
            }
        }
        
    }
    
    func jsonParsing(weatherData: Data) -> WeatherModel? {
        
        let jsonDecoder = JSONDecoder()
        do {
           
            let decodedWeatherData = try jsonDecoder.decode(WeatherDataManager.self, from: weatherData)
            let temp = decodedWeatherData.main.temp
            let id = decodedWeatherData.weatherarray[0].id
            let name = decodedWeatherData.name
            
            let weatherCondition = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weatherCondition
        }
        catch {
            delegate?.isErrorOccured(error: error)
            return nil
        }
    }
    

}
