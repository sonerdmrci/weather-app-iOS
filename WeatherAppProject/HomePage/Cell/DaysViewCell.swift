//
//  DaysViewCell.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit

class DaysViewCell: UITableViewCell {
    
    static let reuseID = "section1"
    
    var dayLabel = UILabel()
    var temperatureLabel = UILabel()
    var imageIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Cell oluşturulduğunda çağrılan metot
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCell(day: String, temperature: String, icon: UIImage){
        self.dayLabel.text = day
        self.temperatureLabel.text = "\(temperature)ºC"
        self.imageIcon.image = icon
    }
    
    func setupViews() {
        contentView.addSubViewsFromExt(dayLabel, temperatureLabel, imageIcon)
        self.temperatureLabel.textColor = .white
        self.dayLabel.textColor = .white
    }
    
    func setupConstraints() {
        
        let standartPadding: CGFloat = 30
        dayLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: standartPadding, paddingLeft: standartPadding)
        
        temperatureLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor,right: contentView.rightAnchor, paddingTop: standartPadding, paddingBottom: standartPadding, paddingRight: standartPadding)
        
        imageIcon.configSize(height: 60, width: 60)
        imageIcon.centerX()
        imageIcon.centerY()
        
       
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        // Sağa ve sola boşluk ekleme
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
//
//        // Köşe yuvarlama (borderRadius)
//        contentView.layer.cornerRadius = 30
//        contentView.layer.masksToBounds = true
//        contentView.layer.borderWidth = 1  // İsterseniz kenar çizgisi de ekleyebilirsiniz
//    }
}
