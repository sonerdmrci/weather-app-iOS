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
    
    //MARK: - Properties
    lazy var tableView =  UITableView()
    
    //MARK: - Properties
    let apiKey = AppConfig.openWeatherMapApiKey
    var fiveDayTemperatures: List?
    var dayList = [List]()
    var days = [List]()
    let dateFormatter = DateFormatter()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        presenter?.fetchData()
        setupUI()
    }
    
    
    //MARK: - Helpers
    func setupUI(){
        configureTableView()
       
        
    }
    
    func configureTableView() {
        tableView.frame = view.bounds
        view.addSubViewsFromExt(tableView) //Ext yazildi birden fazla elemani eklemek icin
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        tableView.register(DaysViewCell.self, forCellReuseIdentifier: DaysViewCell.reuseID)
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.reuseID)
        
    }

    //5 gunluk veri
    func getWeatherForNext5Days(from startDate: Date, in weatherModel: WeatherModel) -> [List] {
        guard let allWeatherData = weatherModel.list else {
            return []
        }
        
        let calendar = Calendar.current
        var currentDate = startDate
        
        for _ in 1...5 {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let filteredData = allWeatherData.filter {
                if let dtTxt = $0.dtTxt, let date = dateFormatter.date(from: dtTxt) {
                    return calendar.isDate(date, inSameDayAs: currentDate)
                }
                return false
            }
            if let firstDataForDay = filteredData.first {
                days.append(firstDataForDay)
            }
            
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        }
        print("return \(days.count)")
        return days
    }
    
    
    //Tarihi gün adına çevirme
    func getDayName(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        return dateFormatter.string(from: date)
    }
    
    //MARK: - Actions
}


//MARK: - AnyView 
extension HomeViewController: AnyView {
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            let startDate = Date()
            let select5days = self.getWeatherForNext5Days(from: startDate, in: weatherModel)
            print("----->>> DEBUG: \(select5days)")
            select5days.forEach { data in
                print("Tarih: \(data.dtTxt ?? ""), Sicaklik: \(data.main?.temp ?? 0.0)")
            }
            self.dayList = select5days
            self.tableView.reloadData()         }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dayList.count
        } else {
            return dayList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.reuseID, for: indexPath) as! DetailViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DaysViewCell.reuseID, for: indexPath) as! DaysViewCell
            if let date = dateFormatter.date(from: dayList[indexPath.row].dtTxt ?? "" ) {
                
                let dayName = getDayName(from: date)
                cell.initCell(day: dayName, temperature: String(dayList[indexPath.row].main?.temp ?? 0.0))
                print(dayName)
            } else {
                print("Geçersiz tarih formatı")
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Gun Detayi"
        } else {
            return "5 gunluk"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Gunlere tiklaninca ne olsun
    }
}
