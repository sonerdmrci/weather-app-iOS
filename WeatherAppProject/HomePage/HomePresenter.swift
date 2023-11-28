//
//  HomePresenter.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation

protocol AnyPresenter {
    var view: AnyView? { get set }
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    
    func fetchData()
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
}

class HomePresenter: AnyPresenter {
    
    func fetchData() {
        interactor?.fetchData()
    }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        view?.didReceiveWeatherData(weatherModel)
    }
    
    var view: AnyView?
    var interactor: AnyInteractor?
    var router: AnyRouter?
    
    
}
