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
        
        let url = URL //creating the URL
        
    }
    
}
