//
//  NetService.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

final class NetService: ObservableObject {
    
    @Published var weather: WeatherData?
    @Published var city = ""
    
    let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    var query = ["q": "", "appid": "", "units": "metric"]
    
    func loadWeatherInfo(by city: String) {
        
        guard baseURL.withQueries(query) != nil, city != "" else { print("URL isn't correct!"); return}
        
        query["appid"] = "!!!YOUR OWN API KEY!!!"
        query["q"] = city
        
        URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { data, _, error in
            print(self.baseURL.withQueries(self.query)!)
            guard let data = data else { print(#line, #function, "\(error!.localizedDescription)"); return }
            
            if let weatherInfo = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async { [weak self] in
                    self?.weather = weatherInfo
                }
            } else {
                print(#line, #function, "incorrect user input!"); return
            }
        }.resume()
    }
}
