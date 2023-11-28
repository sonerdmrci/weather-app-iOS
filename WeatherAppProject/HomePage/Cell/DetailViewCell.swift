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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCell(day: String, temperature: String, description: String, icon: UIImage){
        self.dayLabel.text = day
        self.temperatureLabel.text = "\(temperature)Cº"
        self.descriptionLabel.text = description
        self.imageIcon.image = icon
    }
    
    func setupViews() {
        contentView.addSubViewsFromExt(dayLabel, temperatureLabel, descriptionLabel, imageIcon)
        self.dayLabel.font = UIFont.systemFont(ofSize: 40)
        self.temperatureLabel.font = UIFont.systemFont(ofSize: 80)
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        self.dayLabel.textColor = .white
        self.temperatureLabel.textColor = .white
        self.descriptionLabel.textColor = .green
    }
    
    func setupConstraints() {
        
        let standartPadding: CGFloat = 30
        
        dayLabel.anchor(top: contentView.topAnchor, paddingTop: 16)
        dayLabel.centerX()
        
        imageIcon.anchor(top: dayLabel.bottomAnchor, left: contentView.leftAnchor, paddingTop: 16, paddingLeft: 30, width: 140, height: 140)
        
        descriptionLabel.anchor(top: imageIcon.bottomAnchor,left: contentView.leftAnchor, bottom: contentView.bottomAnchor, paddingTop: 16, paddingLeft: 60, paddingBottom: standartPadding)
        
        temperatureLabel.anchor(right: contentView.rightAnchor,
                                paddingRight: standartPadding)
        temperatureLabel.centerY()
        
        
        
       
    }
}

