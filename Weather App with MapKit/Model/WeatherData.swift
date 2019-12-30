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
        WeatherData(coord: Coordinate(lat: 24.470901, lon: 39.612236),
                    visibility: 00,
                    main: Main(temp: 00, pressure: 00, humidity: 00),
                    wind: Wind(speed: 0.0)
        )
    }
}
