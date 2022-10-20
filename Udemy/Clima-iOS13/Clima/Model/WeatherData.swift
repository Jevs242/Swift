//
//  WeatherData.swift
//  Clima
//
//  Created by Jose Velazquez on 10/10/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    var weather = ([Weather(id: 0 , main: "", description: "" , icon: "")])
}

struct Main: Codable {
    let temp:Double
}

struct Weather: Codable {
    let id:Int
    let main:String
    let description:String
    let icon:String
}
