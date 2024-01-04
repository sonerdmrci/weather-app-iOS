//
//  HomeRouter.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit


class HomeRouter: AnyRouter {
    
    unowned var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigate(router: Routes) {
        switch router {
        case .bottomSheet(let citiesList):
            let vc = BottomSheetViewController()
            vc.citiesList = citiesList
            vc.delegate = viewController as? SelectedCityProtocol
            
            let navCon = UINavigationController(rootViewController: vc)
            navCon.isModalInPresentation = true
            if let sheet = navCon.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.preferredCornerRadius = 30
                sheet.largestUndimmedDetentIdentifier = .medium
            }
            viewController.navigationController?.present(navCon, animated: true)
        }
    }
    
 
    
    
}
