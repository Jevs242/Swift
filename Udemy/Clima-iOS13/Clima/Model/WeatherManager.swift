//
//  WeatherManager.swift
//  Clima
//
//  Created by Jose Velazquez on 10/9/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManaer: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=14cfaf936751d1ea62ea10fc177b4f81&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String)
    {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees , longitude : CLLocationDegrees )
    {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String)
    {
        //Create a URLSession
        if let url = URL(string: urlString)
        {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil
                {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data
                {
                    if let weather = self.parseJSON(safeData)
                    {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4.Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?
    {

        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name , temperature: temp)
            return weather
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
