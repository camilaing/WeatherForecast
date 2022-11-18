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
        if locationManager.location != nil {
            ContentView()
        } else {
            ZStack {
                
                BlurredBackgroundView().gradient
                    
                Button() {
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        })
                    }
                } label: {
                    HStack {
                        Text("Give location permissions")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .background(Color.clear)
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                            .background(Color.clear)
                    }
                }
            }
        }
    }
}

