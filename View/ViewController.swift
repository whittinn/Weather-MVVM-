//
//  ViewController.swift
//  Weather
//
//  Created by Nathaniel Whittington on 5/4/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempcLabel: UILabel!
    @IBOutlet weak var tempfLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    let CITY = "city"
    
    let vm = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func refreshUI(_ sender: Any) {
        if let city = getDataFromDefault() {
            textField.text = city
            callAPI(city:city)
        }
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let city = textField.text else {return}
        saveToUserDefault(city: city)
        callAPI(city:city)
    }
    
    
    func callAPI(city:String) {
        vm.fetchWeather(with: city) { [weak self] location in
            DispatchQueue.main.async {
                if let location = location{
                    print(location)
                    self?.setUI()
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func saveToUserDefault(city:String) {
        let userDefault = UserDefaults.standard
        userDefault.set(city, forKey: CITY)
        userDefault.synchronize()
    }
    
    func getDataFromDefault() ->String? {
        let userDefault = UserDefaults.standard
        return userDefault.string(forKey: CITY)
    }
    
    func setUI(){
        cityLabel.text = self.vm.getCityName()
        tempcLabel.text = self.vm.getCityConditionText()
        tempfLabel.text = "\(self.vm.getCityTemp())"
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.getForecastedDateCount()
        
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
    cell?.tempfText.text = self.vm.getForecastedDate(index: indexPath.row)
    cell?.tempCtext.text = String(self.vm.getForecastedAvgTempF(index: indexPath.row))
    return cell ?? UITableViewCell()
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
   
