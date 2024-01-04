//
//  HomeViewController.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 28.11.2023.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    //MARK: - Viper
    var presenter: AnyPresenter?
    var entry: EntryPoint?
    
    //MARK: - Properties
    lazy var tableView =  UITableView()
    var navigationButton = UIButton(type: .system)
    
    //MARK: - Properties
    let locationManager = CLLocationManager()
    let apiKey = AppConfig.openWeatherMapApiKey
    var fiveDayTemperatures: List?
    var dayList = [List]()
    var days = [List]()
    let dateFormatter = DateFormatter()
    
    var citiesList = [CitiesModel.City]()
    var SEARCH_BUTTON_TITLE = "   ŞEHİR"

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hex("1D3D8D")
        
        setupUI()
//        setupLocation()
        self.presenter?.getCitiesData()
//        addTargets() //TODO: Action eklendiginde acilacak
        
    }
    
    func setupLocation(){
        // Konum izni isteme
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        DispatchQueue.main.async {
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: - Helpers
    func setupUI(){
        configureTableView()
        configureButton()
    }
    
    func configureButton(){
        navigationButton.setTitle(SEARCH_BUTTON_TITLE, for: .normal)
        navigationButton.titleLabel?.font = .systemFont(ofSize: 20)
        navigationButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        navigationItem.titleView = navigationButton
        navigationButton.configSize(height: 30, width: 200)
        navigationButton.addTarget(self, action: #selector(navigationButtonTappend), for: .touchUpInside)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor.hex("1D3D8D")
        
        tableView.register(DaysViewCell.self, forCellReuseIdentifier: DaysViewCell.reuseID)
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.reuseID)
        
        view.addSubview(tableView)
        
    }
    
    private func configureSheet(){
        presenter?.navigate(router: .bottomSheet(citiesList: self.citiesList))
    }

    func addTargets() {
//        detailButton.addTarget(self, action: #selector(toDetailClicked), for: .touchUpInside)
    }
    
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
        case .clear, .clearNight:
            return UIImage(named: "sun")
        case .foggyDay, .foggyNight:
            return UIImage(named: "heavy-rain")
        case .overcastNight, .overcast:
            return UIImage(named: "cloudy1")
        case .partlyCloudyDay, .partlyCloudyNight:
            return UIImage(named: "cloudy")
        case .snowDay, .snowNight :
            return UIImage(named: "snow")
        case .lightRainDay,.lightRainNight:
            return UIImage(named: "rain-sun")
        case .thunderstormNight, .thunderstormDay:
            return UIImage(named: "wind")
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
    
    @objc func navigationButtonTappend(){
        print("button tappend")
        configureSheet()
    }
}


//MARK: - AnyView 
extension HomeViewController: AnyView {
    
    func didCitiesData(_ cityResponse: CitiesModel) {
        let cities = cityResponse.cities
        self.citiesList = cities
    }
    
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        self.days.removeAll()
        self.dayList.removeAll()
        DispatchQueue.main.async {
            let startDate = Date()
            print(startDate)
            let select5days = self.getWeatherForNext5Days(from: startDate, in: weatherModel)
            print("----->>> DEBUG: \(select5days)")
            select5days.forEach { data in
                print("Tarih: \(data.dtTxt ?? ""), Sicaklik: \(data.main?.temp ?? 0.0)")
            }
            self.dayList = select5days
            self.tableView.reloadData()
            
        }
    }
}

//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1: dayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
                return configureDetailViewCell(for: indexPath)
            } else {
                return configureDaysViewCell(for: indexPath)
            }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "" : "    "
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section == 0 && indexPath.row == 0) ? 260 : 70
    }

    private func configureDetailViewCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.reuseID, for: indexPath) as! DetailViewCell
        configureCommonCellProperties(cell, indexPath: indexPath)

        if let firstWeather = dayList.first?.weather?.first,
           let date = dateFormatter.date(from: dayList.first?.dtTxt ?? "") {
            let dayName = getDayName(from: date)

            if let iconImage = getIconImage(for: dayList.first!) {
                cell.initCell(day: dayName,
                              temperature: String(Int(round(dayList.first?.main?.temp ?? 0))),
                              description: firstWeather.description ?? "",
                              icon: iconImage)
            } else {
                print("Geçersiz tarih formatı veya ikon bulunamadı.")
            }
        } else {
            print("Geçersiz tarih formatı detail")
        }

        return cell
    }

    private func configureDaysViewCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DaysViewCell.reuseID, for: indexPath) as! DaysViewCell
        configureCommonCellProperties(cell, indexPath: indexPath)

        if let date = dateFormatter.date(from: dayList[indexPath.row].dtTxt ?? "" ),
           let iconImage = getIconImage(for: dayList[indexPath.row]) {
            let dayName = getDayName(from: date)
            cell.initCell(day: dayName,
                          temperature: String(Int(round(dayList[indexPath.row].main?.temp ?? 0.0))),
                          icon: iconImage)
            print(dayName)
        } else {
            print("Geçersiz tarih formatı day")
        }

        return cell
    }

    private func configureCommonCellProperties(_ cell: UITableViewCell, indexPath: IndexPath) {
        cell.backgroundColor = UIColor.hex(indexPath.section == 0 ? "1D3D8D" : "173481")
        cell.selectionStyle = .none
    }
}

//MARK: - CLLocationManagerDelegate
extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            locationManager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let apiKey = AppConfig.openWeatherMapApiKey
            let path = "&lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
            print(path)
            self.presenter?.fetchData(path)
            
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Konum alınamadı: \(error.localizedDescription)")
        }
}

//MARK: - SelectedCityProtocol
extension HomeViewController: SelectedCityProtocol {
    func fetchSelectedCtyWeather(city: CitiesModel.City) {
        navigationButton.setTitle("   \(city.name)", for: .normal)
        let path = "&lat=\(city.latitude)&lon=\(city.longitude)&appid=\(apiKey)&units=metric"
        presenter?.fetchData(path)
    }
}
