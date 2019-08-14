//
//  ContentView.swift
//  Weather App with MapKit
//
//  Created by Dmitry Novosyolov on 15/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CityWeatherInfoAndMapView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
