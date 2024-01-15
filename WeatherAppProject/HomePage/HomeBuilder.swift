//
//  HomeBuilder.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 4.01.2024.
//

import UIKit

// typealias EntryPoint = AnyView & UIViewController

class HomeBuilder {
    static func createModule() -> HomeViewController {
        let view: HomeViewController = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }
}
