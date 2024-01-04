//
//  CitiesModel.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 3.01.2024.
//

import Foundation

struct CitiesModel: Codable {
    let cities: [City]

    struct City: Codable {
        let plaka: String
        let name: String
        let latitude: Double
        let longitude: Double
    }
}

//let turkishCitiesData: [String: Any] = [
//    "cities": [
//        ["plaka": "01", "name": "Adana", "latitude": 37.0000, "longitude": 35.3213],
//        ["plaka": "02", "name": "Adıyaman", "latitude": 37.7648, "longitude": 38.2786],
//        // Diğer iller buraya eklenecek
//    ]
//]


