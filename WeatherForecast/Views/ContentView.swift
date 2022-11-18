//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                WeatherHeaderView(weatherViewModel: weatherViewModel)
                    .padding(.top, 50)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
