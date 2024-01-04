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


