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
}

class HomePresenter: AnyPresenter {
    var view: AnyView?
    var interactor: AnyInteractor?
    var router: AnyRouter?
    
    
}
