//
//  CurrentWeatherView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today")
                .foregroundColor(.white)
                .font(Font.custom("System", size: 40))
                .shadow(radius: 2.0)
            
            HStack {
                weatherViewModel.getWeatherIcon(icon: weatherViewModel.weatherIcon)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                
                Text(weatherViewModel.temperature + "º")
                    .foregroundColor(.white)
                    .font(Font.custom("System", size: 70))
                    .fontWeight(.thin)
                    .shadow(radius: 2.0)
            }
            
            Text(weatherViewModel.conditions)
                .foregroundColor(.white)
                .font(Font.custom("System", size: 30))
                .shadow(radius: 2.0)
            
            HStack {
                Spacer()
                getIcon(image: "wind", color: .white, title: "\(weatherViewModel.windSpeed) km/hr")
                Spacer()
                getIcon(image: "drop.fill", color: .white, title: "\(weatherViewModel.humidity)")
                Spacer()
                getIcon(image: "umbrella.fill", color: .white, title: "\(weatherViewModel.rainChances)")
                Spacer()
            }
        }
    }
    
    private func getIcon(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
            
            Text(title)
        }
    }
}
