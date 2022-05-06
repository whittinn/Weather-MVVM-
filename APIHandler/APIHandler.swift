//
//  APIHandler.swift
//  Weather
//
//  Created by Nathaniel Whittington on 5/4/22.
//

import Foundation

class APIHandler {
    
    static let shared = APIHandler()
    func fetchData(cityName:String, completionHandler: @escaping (WeatherInformation?)->()){
     
        let URL_END = "http://api.weatherapi.com/v1/forecast.json?key=%205a4e775a094544f9b45170649220405&q="
        let END_BASE = "&days=3&aqi=no&alerts=no"
        
        guard let cityName = URL(string:URL_END + "\(cityName)" + END_BASE) else {return}
        
        URLSession.shared.dataTask(with: cityName) {[weak self] data, response, error in
            guard let _ = self else {return}
           
            if let data = data {
                do{
                    let weatherData = try JSONDecoder().decode(WeatherInformation.self, from: data)
                   
                        print(weatherData)
                        completionHandler(weatherData)
                    
                    
                }catch{
                    print(error)
                }
        }
           
            
        }.resume()
    }
    
}
