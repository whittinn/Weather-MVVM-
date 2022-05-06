//
//  ViewModel.swift
//  Weather
//
//  Created by Nathaniel Whittington on 5/4/22.
//

import Foundation

class ViewModel {
    
    var myModel : WeatherInformation?
    
    
    func fetchWeather(with cityname:String, completionHandler: @escaping (WeatherInformation?)->()){
        
        APIHandler.shared.fetchData(cityName: cityname) { [weak self] weatherInfo  in
                self?.myModel = weatherInfo
                completionHandler(weatherInfo)
            }
    }
    
    func getCityName()->String{
        return myModel?.location?.name ?? ""
    }
    
    func getCityTemp()->Double{
        return myModel?.current?.tempF ?? 0.0
    }
    
    func getCityConditionText()->String{
        return myModel?.current?.condition?.text ?? ""
    }
    
    func getCityConfitionIcon()->String{
        return myModel?.current?.condition?.icon ?? ""
    }
    
    func getForcastedDay(model:WeatherInformation)->[ForecastDay]?{
        return myModel?.forecast?.forecastday
    }
    
    func getForecastedDate(index:Int)->String{
        return myModel?.forecast?.forecastday?[index].date ?? ""
    }
    
    func getForecastedAvgTempF(index: Int)->Double{
        return myModel?.forecast?.forecastday?[index].day?.avgTempf ?? 0.0
    }
    
    func getForecastedDateCount()->Int{
        return myModel?.forecast?.forecastday?.count ?? 0
    }
}
