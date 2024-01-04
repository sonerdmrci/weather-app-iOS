//
//  WeatherModel.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

enum IconEnum: String, Codable {
    case clear = "01n" // Açık (gece)
    case clearNight = "01d" // Açık (gündüz)
    case partlyCloudyDay = "02d" // Parçalı Bulutlu (gündüz)
    case partlyCloudyNight = "02n" // Parçalı Bulutlu (gece)
    case cloudyDay = "03d" // Bulutlu (gündüz)
    case cloudyNight = "03n" // Bulutlu (gece)
    case overcast = "04d" // Kapalı (gündüz)
    case overcastNight = "04n" // Kapalı (gece)
    case lightRainDay = "10d" // Hafif Yağmurlu (gündüz)
    case lightRainNight = "10n" // Hafif Yağmurlu (gece)
    case snowDay = "13d" // Karlı (gündüz)
    case snowNight = "13n" // Karlı (gece)
    case foggyDay = "50d" // Sisli (gündüz)
    case foggyNight = "50n" // Sisli (gece)
    case thunderstormDay = "11d" // Gökgürültülü Fırtına (gündüz)
    case thunderstormNight = "11n" // Gökgürültülü Fırtına (gece)
    
}


// MARK: - WeatherModel
class WeatherModel: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [List]?
    let city: City?

    init(cod: String?, message: Int?, cnt: Int?, list: [List]?, city: City?) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}

// MARK: - City
class City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?

    init(id: Int?, name: String?, coord: Coord?, country: String?, population: Int?, timezone: Int?, sunrise: Int?, sunset: Int?) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: - Coord
class Coord: Codable {
    let lat, lon: Double?

    init(lat: Double?, lon: Double?) {
        self.lat = lat
        self.lon = lon
    }
}

// MARK: - List
class List: Codable {
    let dt: Int?
    let main: MainClass?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let sys: Sys?
    let dtTxt: String?
    let rain, snow: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain, snow
    }

    init(dt: Int?, main: MainClass?, weather: [Weather]?, clouds: Clouds?, wind: Wind?, visibility: Int?, pop: Double?, sys: Sys?, dtTxt: String?, rain: Rain?, snow: Rain?) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.pop = pop
        self.sys = sys
        self.dtTxt = dtTxt
        self.rain = rain
        self.snow = snow
    }
}

// MARK: - Clouds
class Clouds: Codable {
    let all: Int?

    init(all: Int?) {
        self.all = all
    }
}

// MARK: - MainClass
class MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }

    init(temp: Double?, feelsLike: Double?, tempMin: Double?, tempMax: Double?, pressure: Int?, seaLevel: Int?, grndLevel: Int?, humidity: Int?, tempKf: Double?) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
}

// MARK: - Rain
class Rain: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }

    init(the3H: Double?) {
        self.the3H = the3H
    }
}

// MARK: - Sys
class Sys: Codable {
    let pod: Pod?

    init(pod: Pod?) {
        self.pod = pod
    }
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather

class Weather: Codable {
    let id: Int?
    let main: MainEnum?
    let description, icon: String?

    var iconEnum: IconEnum? {
        return IconEnum(rawValue: icon ?? "")
    }

    init(id: Int?, main: MainEnum?, description: String?, icon: String?) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - Wind
class Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?

    init(speed: Double?, deg: Int?, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}


