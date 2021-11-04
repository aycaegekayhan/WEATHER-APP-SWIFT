//
//  WeatherDataManager.swift
//  weatherapi
//
//  Created by Ayça ege Kayhan on 11/4/21.
//

import Foundation

struct WeatherDataManager: Decodable, Encodable {
    
    let name : String
    let main : Main
    let weatherarray : [Weather]
    
}

struct Main : Decodable, Encodable {
    let temp: Double
}

struct Weather: Decodable, Encodable {
    let description : String
    let id : Int
}
