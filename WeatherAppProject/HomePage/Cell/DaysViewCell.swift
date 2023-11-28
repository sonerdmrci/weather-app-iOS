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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Cell oluşturulduğunda çağrılan metot
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCell(day: String, temperature: String){
        dayLabel.text = day
        temperatureLabel.text = temperature
    }
    
    func setupViews() {
        // Gerekli view'leri oluştur
        contentView.addSubViewsFromExt(dayLabel, temperatureLabel)
        
        // Gerekirse view'leri özelleştir
        // Örneğin, text color, font vb.
    }
    
    func setupConstraints() {
        // Constraint'leri oluştur ve view'lere ekle
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false

        // Örnek constraint'ler:
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            temperatureLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
