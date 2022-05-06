struct WeatherInformation: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double?
    let tempF: Double?
    let condition: Condition?
    
    enum CodingKeys: String, CodingKey{
        
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
    }

    
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String?
}


// MARK: - Location
struct Location: Codable {
    let name: String?
  
}

//MARK: - Forecast
struct Forecast: Codable {
    let forecastday : [ForecastDay]?
}
                       
struct ForecastDay: Codable{
    let date : String?
    let day : Day?
}

struct Day: Codable{
    let avgTempf : Double?
    
    enum CodingKeys : String, CodingKey {
        case avgTempf = "avgtemp_f"
    }
}

