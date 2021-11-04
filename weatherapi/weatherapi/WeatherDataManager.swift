//
//  WeatherDataManager.swift
//  weatherapi
//
//  Created by Ayça ege Kayhan on 11/4/21.
//

import Foundation

struct WeatherDataManager: Decodable {
    
    let name : String
    let main : Double
    let weatherarray : [Weather]
    
}

struct Main : Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description : String
}
