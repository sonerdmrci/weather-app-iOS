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
    var searchBar = UISearchBar()
    
    //MARK: - Properties
    let apiKey = AppConfig.openWeatherMapApiKey
    var fiveDayTemperatures: List?
    var dayList = [List]()
    var days = [List]()
    let dateFormatter = DateFormatter()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        presenter?.fetchData()
        setupUI()
//        addTargets() //TODO: Action eklendiginde acilacak
    }
    
    
    //MARK: - Helpers
    func setupUI(){
        configureTableView()
    }
    
    func addTargets() {
//        detailButton.addTarget(self, action: #selector(toDetailClicked), for: .touchUpInside)
    }
    
    func configureTableView() {
        tableView.frame = view.bounds
        view.addSubViewsFromExt(tableView, searchBar) //Ext yazildi birden fazla elemani eklemek icin
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .systemCyan
        searchBar.backgroundColor = .systemCyan
        tableView.register(DaysViewCell.self, forCellReuseIdentifier: DaysViewCell.reuseID)
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.reuseID)
        
        searchBar.anchor(top: view.topAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30 )
        
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
    
    func getIconImage(for day: List) -> UIImage? {
        guard let iconEnum = day.weather?.first?.iconEnum else {
            return nil
        }

        switch iconEnum {
        case .clear:
            return UIImage(named: "sun")
        case .clearNight:
            return UIImage(named: "heavy-rain")
        case .closed:
            return UIImage(named: "cloudy1")
        case .partlyCloud:
            return UIImage(named: "cloudy")
        case .snow:
            return UIImage(named: "snow")
        case .lightRain:
            return UIImage(named: "rain-sun")
        case .rain:
            return UIImage(named: "strom") //siddetli
            
            //heavy-rain = yagmurlu, 
        default:
            return UIImage(named: "disaster")
        }
    }
    
    //MARK: - Actions
    @objc func toDetailClicked(){
        print("detay ekrani")
        //TODO: Detay ekrani yapildiginda aktif edilecek
//        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
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
            return 1
        } else {
            return dayList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.reuseID, for: indexPath) as! DetailViewCell
            cell.backgroundColor = .systemTeal
            if let firstWeather = dayList.first?.weather?.first,
               let date = dateFormatter.date(from: dayList.first?.dtTxt ?? "") {

                let dayName = getDayName(from: date)
                print("day : \(dayName)")
                // İstenilen ikonu almak için IconEnum'u kullanabilirsiniz
                if let iconImage = getIconImage(for: dayList.first!) {

                    cell.initCell(day: dayName,
                                  temperature: String(Int(round(dayList.first?.main?.temp ?? 0))),
                                  description: firstWeather.description ?? "",
                                  icon: iconImage)

                    print(dayName)
                } else {
                    print("Geçersiz tarih formatı veya ikon bulunamadı.")
                }
            } else {
                print("Geçersiz tarih formatı")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DaysViewCell.reuseID, for: indexPath) as! DaysViewCell
           
            cell.backgroundColor = .systemGray4
            
            if let date = dateFormatter.date(from: dayList[indexPath.row].dtTxt ?? "" ),
               
                let iconImage = getIconImage(for: dayList[indexPath.row]) {
                
                let dayName = getDayName(from: date)
                cell.initCell(day: dayName,
                              temperature: String(Int(round(dayList[indexPath.row].main?.temp ?? 0.0))),
                              icon: iconImage)
                print(dayName)
            } else {
                print("Geçersiz tarih formatı")
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else {
            return "   "
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Gunlere tiklaninca ne olsun
    }
}
