//
//  LocationRequestView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 18/11/2022.
//

import SwiftUI

struct LocationRequestView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    init() {
        locationManager.manager.requestWhenInUseAuthorization()
    }
    
    var body: some View {
        ZStack {
            BlurredBackgroundView()
            ContentView(locationManager: locationManager)
        }
    }
}

