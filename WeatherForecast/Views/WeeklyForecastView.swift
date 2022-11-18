//
//  WeeklyForecastView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct WeeklyForecastView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            BlurredBackgroundView()
            VStack {
                Text("WEEKLY FORECAST")
                    .foregroundColor(.white.opacity(0.5))
                    .font(Font.system(size: 14))
                Divider()
                ForEach(weatherViewModel.weather.daily) { weather in
                    LazyVStack {
                        weeklyCell(daily: weather)
                        Divider()
                    }
                }
            }
        }
    }
    
    private func weeklyCell(daily: Daily) -> some View {
        HStack {
            Text(weatherViewModel.getDay(timestamp: daily.dt).uppercased())
                .font(Font.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("MIN: \(weatherViewModel.getTemperature(temp: daily.temp.min))º | MAX: \(weatherViewModel.getTemperature(temp: daily.temp.max))º")
                .font(Font.system(size: 14))
                .frame(width: 150)
            
            Spacer()
            
            weatherViewModel.getWeatherIcon(icon: daily.weather.count > 0 ? daily.weather[0].icon : "sun.max.fill")
                .foregroundColor(.white)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
    }
}

