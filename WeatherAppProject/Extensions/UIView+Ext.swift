//
//  UIView+Ext.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

extension UIView {
    //MARK: -AddSubView
    func addSubViewsFromExt(_ views: UIView...) {
            views.forEach { addSubview($0) }
    }
}
