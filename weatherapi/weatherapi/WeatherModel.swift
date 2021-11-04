//
//  WeatherModel.swift
//  weatherapi
//
//  Created by Ayça ege Kayhan on 11/4/21.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureTurnString: String {
        return String(format: "%.1f", temperature)
    }
    
    func getWeatherCondition(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.min"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.sun"
        }
    }
    
}
