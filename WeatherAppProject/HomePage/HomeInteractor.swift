//
//  HomeInteractor.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    
}

class HomeInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    
}
