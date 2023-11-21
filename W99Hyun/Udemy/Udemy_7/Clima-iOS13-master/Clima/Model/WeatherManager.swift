//
//  WertherManager.swift
//  Clima
//
//  Created by WooHyun on 2023/11/16.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeratherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=10dd943680a5f66aa364aee67e563876&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            task.resume()
        }
        
        func handle(data: Data?, response: URLResponse?, error: Error?) {
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
            }
        }
    }
}
