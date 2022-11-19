//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button() {
                        locationManager.location != nil ? weatherViewModel.getCurrentLocation() : locationManager.openSettings()
                    } label: {
                        HStack {
                            Text("Current Location")
                                .foregroundColor(.white)
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                                .background(Color.clear)
                        }
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 30)
                }
                WeatherHeaderView(weatherViewModel: weatherViewModel)
                ScrollView(showsIndicators: false) {
                    PrincipalView(weatherViewModel: weatherViewModel)
                }
                .padding(.top, 5)
            }
            .padding(.top, 30)
            if weatherViewModel.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.9)
                        .ignoresSafeArea()
                    ProgressView("Fetching Weather")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(radius: 10)
                }

            }
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

