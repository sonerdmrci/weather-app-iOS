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
    
    //MARK: - Properties
    lazy var tableView =  UITableView()
    var searchTableView = UITableView()
    var searchBar = UISearchBar()
    
    //MARK: - Properties
    let locationManager = CLLocationManager()
    let apiKey = AppConfig.openWeatherMapApiKey
    var fiveDayTemperatures: List?
    var dayList = [List]()
    var days = [List]()
    let dateFormatter = DateFormatter()
    var suggestions = [String]()
    
    let turkishCities = [
        "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir",
        "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır",
        "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay",
        "Isparta", "İçel(Mersin)", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri",
        "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin",
        "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ",
        "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman",
        "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"
    ]

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hex("1D3D8D")
        
        
        setupUI()
//        addTargets() //TODO: Action eklendiginde acilacak
        
    }
    
    func setupSearchBar(){
        searchBar.delegate = self
        searchBar.placeholder = "Sehir Ara"
        navigationItem.titleView = searchBar

        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = UIColor.white
        }
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
        setupSearchBar()
        configureTableView(tableView, tag: 1)
        configureTableView(searchTableView, tag: 2)
        configureTableView1()
        configureSearchTableView()
    }
    
    func addTargets() {
//        detailButton.addTarget(self, action: #selector(toDetailClicked), for: .touchUpInside)
    }
    
    func configureTableView1() {
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor.hex("1D3D8D")
        
        tableView.register(DaysViewCell.self, forCellReuseIdentifier: DaysViewCell.reuseID)
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.reuseID)
        
    }
    
    func configureSearchTableView(){
        searchTableView.backgroundColor = .red
        searchTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               left: view.safeAreaLayoutGuide.leftAnchor,
                               right: view.safeAreaLayoutGuide.rightAnchor,
                               paddingLeft: 30,
                               paddingRight: 30,
                               height: 100)
    }
    
    func configureTableView(_ tableView: UITableView, tag: Int) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tag = tag
        view.addSubview(tableView)
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
        case .partlyCloudMin:
            return UIImage(named: "cloudy")
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
        if tableView.tag == 1 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            if section == 0 {
                return 1
            } else {
                return dayList.count
            }
        } else {
            return suggestions.count
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1 {
            if indexPath.section == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.reuseID, for: indexPath) as! DetailViewCell
                cell.backgroundColor = UIColor.hex("1D3D8D")
                cell.selectionStyle = .none
                if let firstWeather = dayList.first?.weather?.first,
                   let date = dateFormatter.date(from: dayList.first?.dtTxt ?? "") {

                    let dayName = getDayName(from: date)
                    print("day : \(dayName)")
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
                    print("Geçersiz tarih formatı detail")
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: DaysViewCell.reuseID, for: indexPath) as! DaysViewCell
               
                cell.backgroundColor = UIColor.hex("173481")
                cell.selectionStyle = .none

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
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = suggestions[indexPath.row]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 1 {
            if section == 0 {
                return ""
            } else {
                return "   "
            }
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            if indexPath.section == 0 && indexPath.row == 0 {
                return 260
            }
        }
        return UITableView.automaticDimension
    }
    
}

extension HomeViewController : UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            suggestions = getSuggestions(for: searchText)
            self.searchTableView.reloadData()
            print(suggestions)
        }
        else if searchText.count == 0 {
            suggestions.removeAll()
            searchTableView.reloadData()
        }
    }

    func getSuggestions(for searchText: String) -> [String] {
        let lowercasedSearchText = searchText.lowercased()
        return turkishCities.filter { $0.lowercased().contains(lowercasedSearchText) }
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
