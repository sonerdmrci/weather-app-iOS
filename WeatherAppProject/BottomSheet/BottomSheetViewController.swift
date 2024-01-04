//
//  BottomSheetViewController.swift
//  WeatherAppProject
//
//  Created by Soner Demirci on 3.01.2024.
//

import UIKit

protocol SelectedCityProtocol{
    func fetchSelectedCtyWeather(city: CitiesModel.City)
}

class BottomSheetViewController: UIViewController {
    
    //MARK: - UI Elements
    lazy var tableView = UITableView()
    var searchBar = UISearchBar()
    
    //MARK: - Properties
    var suggestions = [CitiesModel.City]()
    var delegate: SelectedCityProtocol!
    
    var citiesList = [CitiesModel.City]()
    let mainColor = UIColor.hex("12ABFF")
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI(){
        setupSearchBar()
        configureTableView()
        view.backgroundColor = mainColor
    }
    //C57AFF
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = mainColor
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func setupSearchBar(){
        searchBar.delegate = self
        searchBar.placeholder = "Sehir Ara"
        navigationItem.titleView = searchBar
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = UIColor.white
        }
    }
}

//MARK: - tableView Delegate
extension BottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        suggestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = mainColor
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = suggestions[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCityPlaka = suggestions[indexPath.row].plaka        
        if let selectedCity = citiesList.first(where: { $0.plaka.lowercased() == selectedCityPlaka.lowercased() }) {
            delegate.fetchSelectedCtyWeather(city: selectedCity)
            self.dismiss(animated: true)
        }
        self.dismiss(animated: true)
    }
}

//MARK: - SearchBar delegate
extension BottomSheetViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.count > 2 {
            suggestions = getSuggestions(for: searchText)
            self.tableView.reloadData()
            print(suggestions)
        }
        else if searchText.count == 0 {
            suggestions.removeAll()
            tableView.reloadData()
        }
    }

    func getSuggestions(for searchText: String) -> [CitiesModel.City] {
        let lowercasedSearchText = searchText.lowercased()
        return citiesList.filter { $0.name.lowercased().contains(lowercasedSearchText) }
    }

}
