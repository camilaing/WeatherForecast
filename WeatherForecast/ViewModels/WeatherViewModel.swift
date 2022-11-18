//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import Foundation
import CoreLocation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weather = WeatherForecast.initEmpty()
    @Published var isLoading: Bool = false
    @Published var city: String = "--" {
        didSet {
            getLocation()
        }
    }
    @ObservedObject var locationManager = LocationManager.shared
    
    init() {
        guard let coordinates = locationManager.location else { return }
        city = "Current Location"
        getWeather(coordinate: coordinates)
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.filled"
    }
    
    var temperature: String {
        return getTemperature(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return "--"
    }
    
    var windSpeed: String {
        return String(format: "%0.0f", weather.current.windSpeed)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dewPoint)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    func getTemperature(temp: Double) -> String {
        return String(format: "%0.0f", temp)
    }
    
    func getTime(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDay(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getLocation() {
        isLoading = true
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coordinate: place.location?.coordinate)
            }
        }
    }
    
    func getWeather(coordinate: CLLocationCoordinate2D?) {
        isLoading = true
        if let coordinate = coordinate {
            let urlString = APIURL.getURLForLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            getWeatherVM(for: urlString)
        } else {
            let urlString = APIURL.getURLForLocation(latitude: -34.61315, longitude: -58.37723)
            getWeatherVM(for: urlString)
        }
    }
    
    func getWeatherVM(for urlString: String) {
        isLoading = true
        WeatherService.getWeather(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let forecast):
                DispatchQueue.main.async {
                    self.weather = forecast
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                self.isLoading = false
            }
        }
    }
    
    func getWeatherIcon(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
