//
//  WeatherFavouritesModel.swift
//  WeatherForecast
//
//  Created by Camila Ingberg on 18/11/2022.
//

import Foundation

struct Item: Identifiable, Codable {
    var id: UUID
    var city: String
    var isFaved: Bool
}
