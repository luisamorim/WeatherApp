import Foundation

final class OpenWeatherMapNetworkController: NetworkController {
    
    public var tempUnit:TemperatureUnit = .imperial
    
    func fetchCurrentWeatherData(city: String, completionHandler: @escaping (WeatherData?, NextworkControllerError?) -> Void) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let endpoint = "api.openweathermap.org/data/2.5/weather?q=\(city)&units=\(tempUnit)&appid=\(API.key)"
        
        let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        guard let endpointURL = URL(string: safeURLString!) else {
            completionHandler(nil,NextworkControllerError.invalidURL(safeURLString!))
            return
        }
        
        let dataTask = session.dataTask(with: endpointURL) { (data, response, error) in
            guard error == nil else {
                completionHandler(nil,NextworkControllerError.forwarded(error!))
                return
            }
        }
        
    }
    

    /*
     private func decode(jsonData: Data, endpointURL: URL, completionHandler: @escaping (WeatherData?, NetworkControllerError?) -> Void) {
     let decoder = JSONDecoder()
     do {
     let weatherInfo = try decoder.decode(OpenMapWeatherData.self, from: jsonData)
     
     let weatherData = WeatherData(temperature: weatherInfo.main.temp, condition: (weatherInfo.weather.first?.main ?? "?"), unit: self.tempUnit)
     completionHandler(weatherData, nil)
     } catch let error {
     completionHandler(nil, NetworkControllerError.forwarded(error))
     }
     }
     */
}


private enum API {
    static let key = "ADD_YOUR_API_KEY_HERE"
}
