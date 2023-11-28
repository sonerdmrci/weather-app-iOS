//
//  HomeViewController.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
}

class HomeViewController: UIViewController {
    //MARK: - Viper
    var presenter: AnyPresenter?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
    
    //MARK: - Actions

}

//MARK: - AnyView 
extension HomeViewController: AnyView {
    
}

