//
//  UIView+Ext.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

extension UIView {
    
    //MARK: -Anchor
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
        
        
        translatesAutoresizingMaskIntoConstraints = false //fonk. uyguladığımız UIView elemanlarına bu uygulanacaktır
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    //MARK: - CenterX and CenterY
    func centerX(in view: UIView? = nil, constant: CGFloat = 0) {
        if let view = view {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        } else {
            centerXAnchor.constraint(equalTo: superview!.centerXAnchor, constant: constant).isActive = true
        }
    }
    
    func centerY(in view: UIView? = nil, constant: CGFloat = 0) {
        if let view = view {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        } else {
            centerYAnchor.constraint(equalTo: superview!.centerYAnchor, constant: constant).isActive = true
        }
    }

    
    //MARK: -AddSubView
    func addSubViewsFromExt(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    //MARK: -Width and Height
    //Sadece yükseklik ve genişlik ayarlanmak isterse
    func configSize(height: CGFloat, width: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
