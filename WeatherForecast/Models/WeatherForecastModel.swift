//
//  WeatherForecastModel.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 16/11/2022.
//

import Foundation

// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    let lat, lon: Double
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current
    let daily: [Daily]
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
    
    static func initEmpty() -> WeatherForecast {
        return WeatherForecast(lat: 0.0, lon: 0.0, timezone: "--", timezoneOffset: 0, current: Current.initEmpty(), daily: [Daily]())
    }
}

// MARK: - Current
struct Current: Codable {
    
    let dt: Int
    let sunrise, sunset: Int?
    let temp: Double
    let feelsLike: Double?
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int?
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
   static func initEmpty() -> Current {
        return Current(dt: 1668788837, sunrise: 0, sunset: 0, temp: 0, feelsLike: 0, pressure: 0, humidity: 0, dewPoint: 0, uvi: 0, clouds: 0, visibility: 0, windSpeed: 0, windDeg: 0, weather: Weather.initEmpty())
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    static func initEmpty() -> [Weather] {
        return [Weather(id: 0, main: "--", weatherDescription: "--", icon: "")]
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    let dt: Int
    let sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double?
    let weather: [Weather]
    let clouds: Int
    let pop, uvi: Double?
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case weather, clouds, pop, uvi, rain
    }
}

extension Daily {
    var id: UUID {
        return UUID()
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
    let night, day, eve, morn: Double?
}
