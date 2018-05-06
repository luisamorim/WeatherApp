//
//  NetworkController.swift
//  WeatherApp
//
//  Created by Luis Henrique de Oliveira Amorim on 5/6/18.
//  Copyright © 2018 Nyisztor, Karoly. All rights reserved.
//

import Foundation

public protocol NetworkController{
    func fetchCurrentWeatherData(city:String, completionHandler: @escaping (WeatherData?, NextworkControllerError?) -> Void) -> WeatherData?
}

public struct WeatherData {
    var temperature:Float
    var condition:String
    var unit:TemperatureUnit
}

public enum TemperatureUnit:String{
    case scientific = "scientific"
    case metric = "metric"
    case imperial = "imperial"
}

public enum NextworkControllerError:Error {
    case invalidURL(String)
    case invalidPlayload(URL)
    case forwarded(Error)
}
