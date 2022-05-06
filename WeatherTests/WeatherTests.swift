//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Nathaniel Whittington on 5/4/22.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    var sut : ViewModel?
    override func setUpWithError() throws {
        sut = ViewModel()
        let objLocation = Location(name: "Chicago")
        let objCondition = Condition(text: "Cloudy", icon: "abc.png")
        let objCurrent  = Current(tempC: 15.0, tempF: 12.0, condition: objCondition)
        let objDay = Day(avgTempf: 2.0)
        let objForcastDay = ForecastDay(date: "06", day: objDay )
        let objForecast = Forecast(forecastday: [objForcastDay] )
       
        
        sut?.myModel = WeatherInformation(location: objLocation, current: objCurrent, forecast: objForecast)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    
    func testfetchWeather() {
        
        let expectation = expectation(description: "fetchWeather")
        
        sut?.fetchWeather(with: "Chicago", completionHandler: { weatherData in
            XCTAssertNotNil(weatherData)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetCityName() {
        
        XCTAssertEqual(sut?.getCityName(), "Chicago")
        
    }
    
    func testGetCityTemp() {
        XCTAssertEqual(sut?.getCityTemp(), 15.0)
    }
    
    func testGetCityConditionText() {
        XCTAssertEqual(sut?.getCityConditionText(), "Cloudy")
    }
    
    func testGetCityConfitionIcon() {
        XCTAssertEqual(sut?.getCityConfitionIcon(), "abc.png")
    }

}
