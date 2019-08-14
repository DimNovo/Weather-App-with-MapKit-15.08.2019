//
//  WeatherData.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let coord: Coordinate
    let visibility: Int
    let main: Main
    let wind: Wind
}

struct Coordinate: Decodable {
    let lat, lon: Double
}

struct Main: Decodable {
    let temp, pressure, humidity: Double
}

struct Wind: Decodable {
    let speed: Double
}

extension WeatherData {
    static func all() -> WeatherData {
        WeatherData(
            coord:
            Coordinate(lat: 51.5085, lon: -0.1258),
                    visibility: 8000,
                    main: Main(temp: 7, pressure: 1012, humidity: 81),
                    wind: Wind(speed: 4.6)
        )
    }
}
