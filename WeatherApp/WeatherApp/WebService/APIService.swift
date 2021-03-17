

import Foundation

class APIService :  NSObject {
        
    func apiToGetWeatherData(cityName: String, completion : @escaping (WeatherData) -> ()){
        
        let baseURL = Constents.baseURL + Constents.queryParam + cityName + "&" + Constents.appID
        let sourceURL = URL(string: baseURL)!
        print(sourceURL)
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let watherData = try! jsonDecoder.decode(WeatherData.self, from: data)
                completion(watherData)
            }
        }.resume()
    }
    
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
