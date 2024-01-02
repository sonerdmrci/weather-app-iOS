//
//  HomeInteractor.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation
import Alamofire

class HomeInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    let apiKey = AppConfig.openWeatherMapApiKey
    let baseURL = AppURL.baseUrl
    
    func fetchData(_ path: String) {
        print("istekk")
//        let apiUrl = "\(baseURL)&lat=44.34&lon=10.99&appid=\(apiKey)&units=metric"
        let apiUrl = "\(baseURL)\(path)"
        AF.request(apiUrl, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let weatherModel = try decoder.decode(WeatherModel.self, from: data)
                    // Başarılı bir şekilde veri alındığında, bu veriyi presenter'a iletiyoruz.
                    self.presenter?.didReceiveWeatherData(weatherModel)
                } catch {
                    // JSON parse hatası
                    print(error.localizedDescription)
                }
            case .failure(let error):
                // Network veya başka bir hata durumunda
                print(error.localizedDescription)
            }
        }
    }
    
}
