//
//  LocationManager.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 18/11/2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
           super.init()
           manager.delegate = self
       }

       func requestLocation() {
           manager.requestLocation()
       }

       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           location = locations.first?.coordinate
       }

       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Error getting location", error)
       }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied || manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        } else {
            manager.requestLocation()
        }
    }
}
