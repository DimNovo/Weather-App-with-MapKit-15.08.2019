//
//  CityWeatherInfoAndMapView.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct CityWeatherInfoAndMapView: View {
    @ObservedObject var weatherInfo = NetService()
    @State private var city = ""
    var body: some View {
        VStack {
            MapView(weather: weatherInfo.weather)
                    .frame(maxHeight: 400)
                    .cornerRadius(10)
                    .shadow(color: .secondary, radius: 10)
                TextField("Please enter city name", text: $city) { self.weatherInfo.loadWeatherInfo(by: self.city)}
                
                .font(.custom("", size: 30))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .secondary, radius: 5)
                .padding()
            Spacer()
            CityWeatherInfo(weather: weatherInfo.weather)
        }
        .padding(5)
    }
}
