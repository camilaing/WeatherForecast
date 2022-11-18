//
//  CityWeatherView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct CityWeatherView: View {
    
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                
                Text(date)
            }
            .foregroundColor(.white)
        }
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
