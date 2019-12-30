//
//  CityWeatherInfoAndMapView.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct CityWeatherInfoAndMapView: View {
    @ObservedObject var netService = NetService()
    var body: some View {
        VStack {
            List {
                MapView(weather: netService.weather ?? WeatherData.all())
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 400)
                    .cornerRadius(10)
                    .shadow(color: .secondary, radius: 10)
                TextField("Please enter city name", text: $netService.city)
                { self.netService.loadWeatherInfo(by: self.netService.city)}
                    .font(.custom("", size: 30))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: .secondary, radius: 5)
                    .padding()
                Spacer()
                CityWeatherInfo(weather: netService.weather ?? WeatherData.all())
            }
            .padding(5)
        }
    }
}
