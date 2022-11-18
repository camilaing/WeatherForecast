//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 17/11/2022.
//

import Foundation

struct APIURL {
    static let apiKey = "a5dbb9423efe5fd0a26fd24f6acfa181"
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLForLocation(latitude: Double, longitude: Double) -> String {
            return "\(baseURL)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,alerts&units=metric&appid=\(apiKey)"
    }
}

enum APIError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}

final class WeatherService: ObservableObject {
        
    static func getWeather(for url: URL, completion: @escaping (Result<WeatherForecast, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(WeatherForecast.self, from: data)
                completion(.success(json))
            } catch let error {
                print((String(describing: error)))
                completion(.failure(.decodingError(err: error.localizedDescription)))
            }
        }.resume()
    }
}
