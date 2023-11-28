//
//  HomeViewController.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel)
}

class HomeViewController: UIViewController {
    //MARK: - Viper
    var presenter: AnyPresenter?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        presenter?.fetchData()
    }
    
    
    //MARK: - Actions

}

//MARK: - AnyView 
extension HomeViewController: AnyView {
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            print("----->>> DEBUG: \(weatherModel.list?.count)")
        }
    }
    
    
}

