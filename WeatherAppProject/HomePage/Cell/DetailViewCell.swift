//
//  DetailViewCell.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

class DetailViewCell: UITableViewCell {

    static let reuseID = "section0"
    
    var imageIcon = UIImageView()
    var dayLabel = UILabel()
    var descriptionLabel = UILabel()
    var temperatureLabel = UILabel()
    
    func initCell(day: String, temperature: String, description: String, icon: UIImage){
        setupViews()
        setupConstraints()
        self.dayLabel.text = day
        self.temperatureLabel.text = "\(temperature)º"
        self.descriptionLabel.text = description
        self.imageIcon.image = icon
    }
    
    func setupViews() {
        contentView.addSubViewsFromExt(dayLabel, temperatureLabel, descriptionLabel, imageIcon)
        self.dayLabel.font = .systemFont(ofSize: 40)
        self.temperatureLabel.font = .boldSystemFont(ofSize: 60)
        self.descriptionLabel.font = .systemFont(ofSize: 20)
        self.dayLabel.textColor = .white
        self.temperatureLabel.textColor = .white
        self.descriptionLabel.textColor = .white
    }
    
    func setupConstraints() {
                
        imageIcon.anchor(top: contentView.topAnchor,
                         paddingTop: 20,
                         width: 140,
                         height: 140)
        imageIcon.centerX()
        
        temperatureLabel.anchor(top: imageIcon.bottomAnchor)
        temperatureLabel.centerX()
        
        descriptionLabel.anchor(top: temperatureLabel.bottomAnchor)
        descriptionLabel.centerX()
    }
}

