//
//  HomeRouter.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func createModule() -> AnyRouter
}

class HomeRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func createModule() -> AnyRouter {
        let router = HomeRouter()
        
        var view: AnyView = HomeViewController()
        var presenter: AnyPresenter = HomePresenter()
        var interactor: AnyInteractor = HomeInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        
        return router
    }
    
    
}
