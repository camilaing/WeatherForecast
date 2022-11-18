//
//  PrincipalView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct PrincipalView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            CityWeatherView(city: weatherViewModel.city, date: weatherViewModel.date)
                .shadow(radius: 0)
            CurrentWeatherView(weatherViewModel: weatherViewModel)
                .padding()
            WeeklyForecastView(weatherViewModel: weatherViewModel)
        }
        .padding(.bottom, 30)
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
