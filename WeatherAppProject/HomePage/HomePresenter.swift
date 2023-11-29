//
//  HomePresenter.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation

class HomePresenter: AnyPresenter {
    
    func fetchData(_ path: String) {
        interactor?.fetchData(path)
    }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        view?.didReceiveWeatherData(weatherModel)
    }
    
    var view: AnyView?
    var interactor: AnyInteractor?
    var router: AnyRouter?
    
    
}
