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
    
    func fetchData()
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
}

//MARK: Interactor
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func fetchData()
}

//MARK: View
protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
}

//MARK: Router
protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func createModule() -> AnyRouter
}

