//
//  OpenWeatherMapDataMappings.swift
//  WeatherApp
//
//  Created by Nyisztor, Karoly on 10/26/17.
//  Copyright © 2017 Nyisztor, Karoly. All rights reserved.
//

import Foundation

struct OpenMapWeatherData: Codable {
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain
    
    enum CodingKeys: String, CodingKey {
        case weather = "weather"
        case main = "main"
    }
}

struct OpenMapWeatherWeather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct OpenMapWeatherMain: Codable {
    var temp: Float
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
    }
    
}
