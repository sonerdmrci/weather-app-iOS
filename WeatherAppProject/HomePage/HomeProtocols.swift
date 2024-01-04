//
//  HomeProtocols.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation

//MARK: - Presenter
protocol AnyPresenter {
    var view: AnyView? { get set }
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    
    func navigate(router: Routes)
    func fetchData(_ path: String)
    func getCitiesData()
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
    func didCitiesData(_ cityResponse: CitiesModel)
}

//MARK: Interactor
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func fetchData(_ path: String)
    func getCitiesData()
}

//MARK: View
protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
    func didCitiesData(_ cityResponse: CitiesModel)
}

//MARK: Router
enum Routes {
    case bottomSheet(citiesList: [CitiesModel.City])
}

protocol AnyRouter {
    func navigate(router: Routes)
    
}

