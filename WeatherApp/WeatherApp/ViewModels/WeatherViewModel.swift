

import Foundation

class WeatherViewModel : NSObject {
    private var apiService : APIService!
    public var cityName : String!

    private(set) var watherData : WeatherData! {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
       
    }
    func apiCalling()  {
        self.apiService =  APIService()
        callFuncToGetWeatherData(cityName: self.cityName)
    }
    
    func callFuncToGetWeatherData(cityName: String) {
        
        self.apiService.apiToGetWeatherData(cityName: cityName) { (weatherData) in
            self.watherData = weatherData
        }
        
    }
}
