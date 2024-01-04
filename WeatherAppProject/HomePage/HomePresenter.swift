//
//  HomePresenter.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {
    func presentBottomSheet()
}

class HomePresenter: AnyPresenter {
    // MARK: - viper delegates
    internal var view: AnyView?
    var interactor: AnyInteractor?
    internal var router: AnyRouter?
    

    // MARK: - initialize
    init(view: AnyView, interactor: AnyInteractor, router: AnyRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor?.presenter = self
    }
    
    weak var delegate: HomePresenterDelegate?

    
    func navigate(router: Routes) {
        self.router?.navigate(router: router)
    }
    
    func getCitiesData() {
        self.interactor?.getCitiesData()
    }
    
    func didCitiesData(_ cityResponse: CitiesModel) {
        self.view?.didCitiesData(cityResponse)
    }
    
    func fetchData(_ path: String) {
        interactor?.fetchData(path)
    }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        view?.didReceiveWeatherData(weatherModel)
    }
    
    func presentBottomSheet() {
        delegate?.presentBottomSheet()
    }
}


